class InsertInitialConditions < ActiveRecord::Migration[5.2]
  def change
    conditions = ["新品、未使用", "未使用に近い", "目立った傷や汚れあり", "やや傷や汚れあり","全体的に状態が悪い"]
    conditions.each do |condition|
      Condition.create(name:condition)
    end
  end
end

