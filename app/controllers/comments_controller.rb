class CommentsController < ApplicationController
    def new
        if params['type']=='bill'
            @comments = BillDetail.where(id_params).first.comments.create(comment_params) 
        else
            @comments = Expense.where (id_params).first.comments.create(comment_params)
        end
    end

    def comment_params
        params.require('comments').permit('comments','comment')
    end
    def id_params
        params.require('comments').permit('id')
    end
    
end
