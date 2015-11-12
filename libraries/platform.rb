class Chef
  class Recipe
    def redhat?
      node.platform_family == 'rhel'
    end
  end
end
