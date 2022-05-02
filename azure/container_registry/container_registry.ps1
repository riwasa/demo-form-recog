# *****************************************************************************
#
# File:        container_registry.ps1
#
# Description: Creates a Container Registry.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.
# 
# *****************************************************************************

# Get script variables.
. $PSScriptRoot\..\script_variables.ps1

# Create a Container Registry.
Write-Host "Creating a Container Registry"

az deployment group create `
  --name "container_registry" `
  --resource-group "$resourceGroupName" `
  --template-file "$PSScriptRoot\container_registry.bicep" `
  --parameters "$PSScriptRoot\container_registry.azuredeploy.parameters.json" `
  --parameters containerRegistryName="$containerRegistryName" `
               location="$location"