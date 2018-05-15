# Psychic::Poker


```
git clone https://github.com/kenjione/psychic_poker
```

And then execute:

    $ bundle


## Usage

```
$ bin/console
```
```ruby
> PsychicPoker.search '2H 2S 3H 3S 3C 2D 9C 3D 6C TH'
# => Hand: 2H 2S 3H 3S 3C Deck: 2D 9C 3D 6C TH Best hand: full-house'
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.
