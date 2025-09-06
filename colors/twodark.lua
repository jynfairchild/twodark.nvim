for k in pairs(package.loaded) do
    if k:match(".*twodark.*") then package.loaded[k] = nil end
end

require('twodark').setup()
require('twodark').colorscheme()
