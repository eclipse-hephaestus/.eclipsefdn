local orgs = import 'vendor/otterdog-defaults/otterdog-defaults.libsonnet';

orgs.newOrg('automotive.hephaestus', 'eclipse-hephaestus') {
  settings+: {
    name: "Eclipse SDV Hephaestus project",

    has_discussions: true,
    discussion_source_repository: "eclipse-hephaestus/hephaestus",

  },
} + {
  # snippet added due to 'https://github.com/EclipseFdn/otterdog-configs/blob/main/blueprints/add-dot-github-repo.yml'
  _repositories+:: [
    orgs.newRepo('.github')
  ],
}