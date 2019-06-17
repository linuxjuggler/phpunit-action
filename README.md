# PHPUnit 8 Action for Testing your PHP application

The PHPUnit Action is mainly used for Testing your PHP application, this action does not have the capability to test
your database functionality (yet).

The script does not assume that you have installed [PHPUnit](https://phpunit.de/) already, but it uses a global version
that is installed on the system.


## Usage

The PHPUnit action requires no arguments. An example:

```
workflow "PHPUnit testing" {
  on = "push"
  resolves = ["PHPUnit Action"]
}

action "PHPUnit Action" {
  uses = "linuxjuggler/phpunit-action@master"
}
```

This will:

1. Install all the required php packages.
2. Run `phpunit` and test your code.


## Laravel users note

If you are a laravel user, just remember that your tests won't work unless you set the `APP_KEY` environment value,
so you should generate one locally using the command

```shell
$ php artisan key:generate --show
```

which will output something like

```
base64:SkHcrzzvsl66A3Yv3ixxhB5okZaHJnRA2DixnyJPHxY=
```

then you should copy that value and add it as the value for your `APP_KEY` variable, like the following example:

```
workflow "PHPUnit testing" {
  on = "push"
  resolves = ["PHPUnit Action"]
}

action "PHPUnit Action" {
  uses = "linuxjuggler/phpunit-action@master"
  env = {
    APP_KEY = "base64:SkHcrzzvsl66A3Yv3ixxhB5okZaHJnRA2DixnyJPHxY="
  }
}
```

## Testing Guthub Actions locally

One of the best tools I've found is `act`, which can be found at [nektos/act](https://github.com/nektos/act). With it 
installed locally on your system you can test your actions workflow even before you push anything to github. Please 
check the [act repository](https://github.com/nektos/act) for more information.


## License

The Dockerfile and associated scripts and documentation in this project are released under the [MIT License](LICENSE).