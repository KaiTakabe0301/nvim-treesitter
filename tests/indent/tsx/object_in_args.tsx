fn({
    key: val,
})

function Component(): JSX.Element {
  const { data } = useQuery({
      variables: {
        id: "123",
      },
  })

  fn(other, {
    key: val,
  })

  const inner = async () => {
    const { errors } = await deleteMutation({
        variables: {
          input: {
            id: "123",
          },
        },
    });
  };

  return <div />
}
