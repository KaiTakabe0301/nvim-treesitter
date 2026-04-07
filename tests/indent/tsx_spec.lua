local Runner = require('tests.indent.common').Runner

local run = Runner:new(it, 'tests/indent', {
  tabstop = 2,
  shiftwidth = 2,
  softtabstop = 0,
  expandtab = true,
})

describe('indent TSX:', function()
  describe('whole file:', function()
    run:whole_file({ 'tsx/' }, {
      expected_failures = {},
    })
  end)

  describe('new line:', function()
    -- object as first argument: fn({ gets both arguments and object indent
    for _, info in ipairs({
      { 1, 4 },
      { 3, 0 },
      { 6, 6 },
      { 10, 2 },
      { 13, 4 },
      { 15, 2 },
      -- await + nested fn({ with deep object nesting
      { 17, 8 },
      { 19, 12 },
      { 23, 4 },
      { 27, 0 },
    }) do
      run:new_line(
        'tsx/object_in_args.tsx',
        { on_line = info[1], text = '//', indent = info[2] },
        info[3],
        info[4]
      )
    end
  end)
end)
