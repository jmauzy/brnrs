if Rails.configuration.webpack[:use_manifest]
  asset_manifest = Rails.root.join('public', 'assets','bundle', 'webpack-asset-manifest.json')
  common_manifest = Rails.root.join('public', 'assets','bundle', 'webpack-common-manifest.json')

    if File.exist?(asset_manifest)
      puts 'Asset manifest found'
      Rails.configuration.webpack[:asset_manifest] = JSON.parse(
        File.read(asset_manifest),
      ).with_indifferent_access
    else
      puts 'WARNING: NO ASSET MANIFEST FOUND'
    end

    if File.exist?(common_manifest)
      puts 'Common manifest found'
      Rails.configuration.webpack[:common_manifest] = JSON.parse(
        File.read(common_manifest),
      ).with_indifferent_access
    else 
      puts 'WARNING: NO COMMON MANIFEST FOUND'
    end

    puts 'Asset manifest:'
    puts Rails.configuration.webpack[:asset_manifest]

    puts 'Common manifest:'
    puts Rails.configuration.webpack[:common_manifest]
end
