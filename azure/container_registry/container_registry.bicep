// *****************************************************************************
//
// File:        container_registry.bicep
//
// Description: Creates a Container Registry.
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

@description('The name of the Container Registry.')
param containerRegistryName string

@description('The location of the resources.')
param location string

@description('Enables public network access.')
@allowed([
  'Disabled'
  'Enabled'
])
param publicNetworkAccess string

@description('Enables zone redundancy.')
@allowed([
  'Disabled'
  'Enabled'
])
param zoneRedundancy string

@description('The name of the SKU.')
@allowed([
  'Basic'
  'Classic'
  'Premium'
  'Standard'
])
param skuName string

// Create a Container Registry.
resource containerRegistry 'Microsoft.ContainerRegistry/registries@2021-12-01-preview' = {
  name: containerRegistryName
  location: location
  properties: {
    publicNetworkAccess: publicNetworkAccess
    zoneRedundancy: zoneRedundancy
  }
  sku: {
    name: skuName
  }
}
