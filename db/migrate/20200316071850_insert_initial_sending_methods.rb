class InsertInitialSendingMethods < ActiveRecord::Migration[5.2]
  def change
    sending_methods = ["佐川急便", "クロネコヤマト", "ゆうパック"]
    sending_methods.each do |sending_method|
      SendingMethod.create(name:sending_method)
    end
  end
end