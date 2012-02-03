module ShowDescriptionsPatch
  module QueriesHelperPatch
    def self.included(base)
      base.send(:include, InstanceMethods)
      base.class_eval do
        alias_method_chain :retrieve_query, :show_desc
        alias_method_chain :retrieve_query, :show_desc_collapsed
      end
    end

    module InstanceMethods
      def retrieve_query_with_show_desc
        retrieve_query_without_show_desc
        if params[:query]
          @query.show_desc = params[:query][:show_desc]
        else
          @query.show_desc = (@query.show_desc == '' || @query.show_desc == 'false' ) ? false : @query.show_desc
        end
      end

      def retrieve_query_with_show_desc_collapsed
        retrieve_query_without_show_desc_collapsed
        if params[:query]
          @query.show_desc_collapsed = params[:query][:show_desc_collapsed]
        end
      end
    end
  end
end
