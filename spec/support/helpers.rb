# @param [Constant] Model class for which we want to build default factory_name
# @return [Symbol] default factory name
def factory_name(constant)
  constant.to_s.underscore.to_sym
end
