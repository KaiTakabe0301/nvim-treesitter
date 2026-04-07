local Runner = require('tests.indent.common').Runner

local run = Runner:new(it, 'tests/indent', {
  tabstop = 2,
  shiftwidth = 2,
  softtabstop = 0,
  expandtab = true,
})

describe('indent TypeScript:', function()
  describe('whole file:', function()
    run:whole_file({ 'ecma/', 'typescript/' }, {
      expected_failures = {},
    })
  end)

  describe('new line:', function()
    -- object as first argument: fn({ gets both arguments and object indent
    for _, info in ipairs({
      { 1, 4 },
      { 3, 0 },
      { 6, 6 },
      { 8, 2 },
      { 11, 2 },
      { 13, 0 },
      { 15, 4 },
      { 19, 0 },
      -- await + nested fn({ with deep object nesting
      { 23, 8 },
      { 25, 12 },
      { 29, 4 },
      { 31, 0 },
    }) do
      run:new_line(
        'typescript/object_in_args.ts',
        { on_line = info[1], text = '//', indent = info[2] },
        info[3],
        info[4]
      )
    end
  end)
end)
