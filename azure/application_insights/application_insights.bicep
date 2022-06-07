// *****************************************************************************
//
// File:        application_insights.bicep
//
// Description: Creates an Application Insights Component.
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

@description('The name of the Application Insights Component.')
param applicationInsightsName string

@description('The name of the Log Analytics Workspace.')
param logAnalyticsName string

@description('The location of the resources.')
param location string

@description('Enables public network access for ingestion.')
@allowed([
  'Disabled'
  'Enabled'
])
param publicNetworkAccessForIngestion string

@description('Enabled public network access for query.')
@allowed([
  'Disabled'
  'Enabled'
])
param publicNetworkAccessForQuery string

// Get the existing Log Analytics Workspace.
resource logAnalyticsWorkspace 'Microsoft.OperationalInsights/workspaces@2021-12-01-preview' existing = {
  name: logAnalyticsName
}

// Create an Application Insights Component.
resource applicationInsights 'Microsoft.Insights/components@2020-02-02' = {
  name: applicationInsightsName
  location: location
  kind: 'web'
  properties: {
    Application_Type: 'web'
    Flow_Type: 'Bluefield'
    publicNetworkAccessForIngestion: publicNetworkAccessForIngestion
    publicNetworkAccessForQuery: publicNetworkAccessForQuery
    Request_Source: 'rest'
    WorkspaceResourceId: logAnalyticsWorkspace.id
  }
}
