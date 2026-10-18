public import protocol ArgumentParser.ExpressibleByArgument
public import struct ConfigurationParser.OptionOverride

extension OptionOverride: ExpressibleByArgument {
    public init?(argument: String) {
        self.init(argument)
    }
}
