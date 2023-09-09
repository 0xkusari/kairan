# Kairanのcontracts

## Documentation

Foundryのドキュメント
https://book.getfoundry.sh/

## Usage

### Build

```shell
forge build
```

### Test

```shell
forge test
```

テストの実行ログを詳細に出す
```shell
forge test -vv
forge test -vvvv
```

console2 でログも出せます
```shell
console2.log("tokenId: %d", tokenId);
```

### Format

```shell
$ forge fmt
```

### Gas Snapshots

```shell
$ forge snapshot
```

### Anvil

```shell
$ anvil
```

### Deploy

```shell
$ forge script script/Counter.s.sol:CounterScript --rpc-url <your_rpc_url> --private-key <your_private_key>
```

### Cast

```shell
$ cast <subcommand>
```

### Help

```shell
$ forge --help
$ anvil --help
$ cast --help
```
