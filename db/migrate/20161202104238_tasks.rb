require_relative '../../config/application.rb'


class Tasks < ActiveRecord::Migration
  def change
    
    create_table :tasks do |t|
    	t.string :description
    	t.string :status
      
      t.timestamps null: false
    end
  end
end
