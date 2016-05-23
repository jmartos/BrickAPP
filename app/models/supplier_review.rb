class SupplierReview < ActiveRecord::Base
  belongs_to :supplier

  def user_valoration
  end

  def user_valoration_averege (supplier)
  end

  def budget_valoration
    return 0 if projected_budget.to_f.zero?
    (final_budget.to_f * 100) / projected_budget.to_f
  end

  def budget_valoration_average (supplier)

  end

  def percentage_fixes_valoration

  end

  def percentage_fixes_valoration_average (supplier)
  end


end
