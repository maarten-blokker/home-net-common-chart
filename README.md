# Home-net common Helm chart

This Helm chart serves as a library chart to simplify the creation of Helm charts by providing opinionated defaults. It
is designed to be used as a dependency in other charts, allowing for a consistent and reusable configuration across
multiple deployments.

## Requirements

- Kubernetes: `>=1.19.0`
- Helm: `>=3.0`
- [helm-unittest](https://github.com/helm-unittest/helm-unittest) plugin for testing

## Features

- Provides sensible and opinionated defaults to streamline chart creation.
- Designed to be used as a library chart, requiring minimal configuration.
- Supports Helm unit tests using `helm-unittest` to validate chart configurations.

## Installation

This chart is meant to be used as a dependency in other Helm charts. To include it, add the following dependency to
your chart:

```yaml
# file: Chart.yaml
dependencies:
  - name: common-chart
    version: <version>
    repository: https://common-chart.home-net.app
    import-values:
      - default
```

Then, add a file to your templates directory that renders all the library chart's templates:

```yaml
# file: templates/main.yaml
{{ include "common.main" . }}
```

Finally, update dependencies using:

```sh
helm dependency update
```

## Running Unit Tests

This chart uses the [helm-unittest](https://github.com/helm-unittest/helm-unittest) Helm plugin for testing. To install
the plugin, run:

```sh
helm plugin install https://github.com/helm-unittest/helm-unittest.git
```

To run tests:

```sh
helm unittest charts/<chart-name>
```

## Contributing

Contributions are welcome! Please ensure that any changes are tested using `helm-unittest` before submitting a pull
request.

