fn({
    key: val,
})

function test(): void {
  fn({
      key: val,
  })
}

fn(other, {
  key: val,
})

const result = useSomeQuery({
    variables: {
      id: "123",
    },
})

const outer = () => {
  const inner = async () => {
    const { errors } = await deleteMutation({
        variables: {
          input: {
            id: "123",
          },
        },
    });
  };
};
