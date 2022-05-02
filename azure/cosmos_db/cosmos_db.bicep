// *****************************************************************************
//
// File:        cosmos_db.bicep
//
// Description: Creates a Cosmos DB Database Account and Database.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.
//
// *****************************************************************************

@description('The name of the Cosmos DB Database Account.')
param accountName string

@description('The name of the Cosmos DB Database.')
param databaseName string

@description('The location of the resources.')
param location string

@description('The name of the location of the resources.')
param locationName string

@description('The default consistency level.')
@allowed([
  'BoundedStaleness'
  'ConsistentPrefix'
  'Eventual'
  'Session'
  'Strong'
])
param consistencyLevel string

@description('The default portal UI experience.')
param defaultExperience string

@description('Indicates if the Database Account should be provisioned in the Free tier.')
param isFreeTier bool = false

@description('Indicates if the DatabaseAccount should be provisioned as Serverless.')
param isServerless bool = false

@description('The number of minutes between periodic backups.')
@minValue(60)
@maxValue(1440)
param periodicBackupIntervalInMinutes int

@description('The number of hours to retain a backup.')
@minValue(8)
@maxValue(720)
param periodicBackupRetentionInHours int

@description('The storage redundancy for periodic backups.')
@allowed([
  'Geo'
  'Local'
  'Zone'
])
param periodicBackupStorageRedundancy string

var serverlessCapabilities = [
  {
    name: 'EnableServerless'
  }
]

// Create a Cosmos DB Database Account.
resource account 'Microsoft.DocumentDB/databaseAccounts@2021-07-01-preview' = {
  name: accountName
  location: location
  kind: 'GlobalDocumentDB'
  properties: {
    backupPolicy: {
      type: 'Periodic'
      periodicModeProperties: {
        backupIntervalInMinutes: periodicBackupIntervalInMinutes
        backupRetentionIntervalInHours: periodicBackupRetentionInHours
        backupStorageRedundancy: periodicBackupStorageRedundancy
      }
    }
    capabilities: isServerless ? serverlessCapabilities : null
    consistencyPolicy: {
      defaultConsistencyLevel: consistencyLevel
    }
    createMode: 'Default'
    databaseAccountOfferType: 'Standard'
    enableFreeTier: isFreeTier
    locations: [
      {
        failoverPriority: 0
        isZoneRedundant: true
        locationName: locationName
      }
    ] 
  }
  tags: {
    defaultExperience: defaultExperience
  }
}

// Create a Cosmos DB Database.
resource database 'Microsoft.DocumentDB/databaseAccounts/sqlDatabases@2021-07-01-preview' = {
  name: databaseName
  parent: account
  properties: {
    resource: {
      id: databaseName
    }
  }
}
