local orgs = import 'vendor/otterdog-defaults/otterdog-defaults.libsonnet';

orgs.newOrg('automotive.hephaestus', 'eclipse-hephaestus') {
  settings+: {
    name: "Eclipse SDV Hephaestus project",
  },
}
