module MonthApprovalsHelper
 
  def update
    @month_approval = @user.month_approvals.create()
    @superior_user = User.where(superior: true)
    if @month_approval.update_attributes(approvals_params)
      flash[:success] = "申請しました！"
    else
    end
  end
  
private
  def month_approval_params
    params.require(:user).permit(month_approval: [:applicant_user_id, :approval_superior_id, :approval_status])[:month_approvals]
  end
end
