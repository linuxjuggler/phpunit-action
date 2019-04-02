# PHPUnit Action for Testing your PHP application

The PHPUnit Action is mainly used for Testing your PHP application, this action does not have the capability to test
your database functionality (yet).


## Usage

The PHPUnit action requires no arguments. An example:

```
action "linuxjuggler/phpunit-action" {
  uses = "linuxjuggler/phpunit-action@0.1"
}
```

This will:

1. Install all the required php packages.
2. Run `phpunit` and test your code.

## License

The Dockerfile and associated scripts and documentation in this project are released under the [MIT License](LICENSE.md).
