// WARNING: Contains some auto-generated boilerplate code, see:
// HHVM\UserDocumentation\MarkdownExt\ExtractedCodeBlocks\FilterBase::addBoilerplate

namespace HHVM\UserDocumentation\Guides\Hack\AsynchronousOperations\Blocks\SyntacticSugar;

async function get_int_async(): Awaitable<int> {
  return 4;
}

async function get_float_async(): Awaitable<float> {
  return 1.2;
}

async function get_string_async(): Awaitable<string> {
  return "Hello";
}

async function call_async<Tv>((function(): Awaitable<Tv>) $gen): Awaitable<Tv> {
  return await $gen();
}

async function use_async_lambda(): Awaitable<void> {
  // To use an async lambda with no arguments, you would need to have a helper
  // function to return an actual Awaitable for you.
  $x = await call_async(
    async () ==> {
      $y = await get_float_async();
      $z = await get_int_async();
      return \round($y) + $z;
    },
  );
  \var_dump($x);
}

async function use_async_block(): Awaitable<void> {
  // With an async block, no helper function is needed. It is all built-in to the
  // async block itself.
  $x = await async {
    $y = await get_float_async();
    $z = await get_int_async();
    return \round($y) + $z;
  };
  \var_dump($x);
}

async function call_async_function(): Awaitable<void> {
  // Normally we have to call a simple async function and get its value, even
  // if it takes no arguments, etc.
  $x = await get_string_async();
  \var_dump($x);
}

async function use_async_block_2(): Awaitable<void> {
  // Here we can inline our function right in the async block
  $x = await async {
    return "Hello";
  };
  \var_dump($x);
}

<<__EntryPoint>>
function main(): void {
  \init_docs_autoloader();

  \HH\Asio\join(use_async_lambda());
  \HH\Asio\join(use_async_block());
  \HH\Asio\join(call_async_function());
  \HH\Asio\join(use_async_block_2());
}
