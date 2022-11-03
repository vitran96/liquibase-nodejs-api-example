const node_liquibase = require('liquibase');
const path = require('path');

const hostname = "localhost";
const port = ":5432";
const dbname = "test1";
const username = "postgres";
const password = "admin";

const changelogFile = "changeset.sql";

const inst = new node_liquibase.Liquibase({
    ...node_liquibase.POSTGRESQL_DEFAULT_CONFIG,
    changeLogFile: changelogFile,
    url: `jdbc:postgresql://${hostname}${port}/${dbname}`,
    username: username,
    password: password,
    logLevel: node_liquibase.LiquibaseLogLevels.Info,
    // classpath: undefined,
    // liquibase: undefined,
    // liquibaseCatalogName: undefined,
    // liquibaseProLicenseKey: undefined,
    // liquibasePropertiesFile: undefined,
    // liquibaseSchemaName: undefined,
    // referencePassword: undefined,
    // referenceUrl: undefined,
    // referenceUsername: undefined
});

inst.update({
    contexts: undefined,
    labels: undefined
});
