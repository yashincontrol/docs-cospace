# Docs Cospace

This cospace helps to build the iTwin.js documentation site locally. It uses the following repos:
- [iTwin.js Core](https://github.com/iTwin/itwinjs-core)
- [iTwin.js Presentation](https://github.com/iTwin/presentation)
- [iTwin.js AppUI](https://github.com/iTwin/appui)
- [imodel-transformer](https://github.com/iTwin/imodel-transformer)
- [BeMetalsmith](https://dev.azure.com/bentleycs/iModelTechnologies/_git/BeMetalsmith)


## Building docs

1. Clone all the repos you want to link together under the `repos` directory.

1. The [pnpm-workspace.yaml](pnpm-workspace.yaml) and [cospace.code-workspace](cospace.code-workspace) files are set to include all the repos mentioned above by default. You can leave those files as they are or make changes to them as desired.

1. Run `pnpm setOverrides` to automatically update the `pnpm.overrides` section of the CoSpace's [package.json](package.json), to use the local package version from the workspace, disregarding semver. Useful for when you have pre-release versions of packages in your workspace.

1. Run `pnpm install` to install all the packages you've added to your CoSpace.

1. Run `pnpm build` to build all the packages you've added to your CoSpace using your monorepo task runner. I'm using [lage](https://microsoft.github.io/lage/), but [turborepo](https://turborepo.org/docs) should theoretically work.

1. Run `pnpm run docs` to generate the documentation and copy over to a staging directory (By default named staging-docs and present at the root of the cospace).

1. Run `pnpm watch:core` to start the dev server.
