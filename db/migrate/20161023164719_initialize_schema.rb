class InitializeSchema < ActiveRecord::Migration[5.0]
  def change
    # create_table :company_staging do |t|
    #   t.text :symbol
    #   t.text :name
    #   t.column  :market_cap, :decimal, :precision => 8, :scale => 2
    #   t.column  :last_sale, :decimal, :precision => 8, :scale => 5
    #   t.text :adr_tso
    #   t.integer :ipo_year
    #   t.text :sector
    #   t.text :industry
    #   t.text :summary_quote
    # end
    create_table :exchanges do |t|
      t.text :name
      t.references(:company, index: true)
    end

    create_table :companies do |t|
      t.text :symbol
      t.text :name
      t.column  :market_cap, :decimal, :precision => 20, :scale => 2
      t.column  :last_sale, :decimal, :precision => 12, :scale => 5
      t.text :adr_tso
      t.integer :ipo_year
      t.text :sector
      t.text :industry
      t.text :summary_quote
      t.belongs_to(:exchange, foreign_key: true)
    end
  end
end
