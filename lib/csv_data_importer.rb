require 'smarter_csv'
require 'activerecord-import'

class CSVDataImporter
  
  def import
    threads = []
    [import_users, import_items, import_user_items, import_categories, 
            import_category_items].each{|task| threads<< Thread.new{task}}
    threads.map(&:join)
  end
  
  private
  
  def import_users
    import_records(users_csv_path, User, id: :user_id, name: :name)
  end
  
  def import_items
    import_records(items_csv_path, Item, id: :item_id, name: :name)
  end
  
  def import_user_items
    import_records(user_items_csv_path, UserItem, user_id: :user_id, item_id: :item_id)
  end
  
  def import_categories
    import_records(categories_csv_path, Category, id: :category_id, name: :name)
  end
  
  def import_category_items
    import_records(category_items_csv_path, CategoryItem, category_id: :category_id, item_id: :item_id)
  end
  
  def import_records(csv_path, record_class, column_mapping)
    each_csv_chunk(csv_path) do |chunk|
      csv_columns = column_mapping.values
      
      records = chunk.map do |row|
        record_attributes = {}
        column_mapping.each do |db_column, csv_column|
          record_attributes[db_column] = row[csv_column]
        end
        
        record_class.new(record_attributes)
      end
      
      record_class.import(records)
    end
  end

  def users_csv_path
    csv_path('mini_proj-users.csv')
  end

  def items_csv_path
    csv_path('mini_proj-items.csv')
  end
  
  def categories_csv_path
    csv_path('mini_proj-categories.csv')
  end
  
  def category_items_csv_path
    csv_path('mini_proj-categories_items.csv')
  end
  
  def user_items_csv_path
    csv_path('mini_proj-items_users.csv')
  end
  
  def csv_path(filename)
    Rails.root.join('db', filename)
  end
  
  def each_csv_chunk(filepath)
    SmarterCSV.process(filepath, csv_options) do |chunk|
      yield chunk
    end
  end
  
  def csv_options
    { chunk_size: 1000, col_sep: "\t" }
  end
end
