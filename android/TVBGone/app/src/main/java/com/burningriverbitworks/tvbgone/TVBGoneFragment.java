package com.burningriverbitworks.tvbgone;

import android.content.Context;
import android.hardware.ConsumerIrManager;
import android.os.Bundle;
import android.support.annotation.Nullable;
import android.support.v4.app.Fragment;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

public class TVBGoneFragment extends Fragment {


    public static TVBGoneFragment newInstance() {
        return new TVBGoneFragment();
    }

    @Override
    public View onCreateView(LayoutInflater inflater, @Nullable ViewGroup container, @Nullable Bundle savedInstanceState) {
        View view = inflater.inflate(R.layout.fragment_tvbgone, container, false);
        TextView tv = (TextView) view.findViewById(R.id.text_view);

        ConsumerIrManager irManager = (ConsumerIrManager) getActivity().getSystemService(Context.CONSUMER_IR_SERVICE);

        if (irManager.hasIrEmitter()) {
            ConsumerIrManager.CarrierFrequencyRange[] carrierFrequencies = irManager.getCarrierFrequencies();
            tv.setText(String.format("Has IR: %b \nSize of ranges: %d\nRange High: %d, Range Low:%d",
                    irManager.hasIrEmitter(), carrierFrequencies.length
                    , carrierFrequencies[0].getMinFrequency(),
                    carrierFrequencies[0].getMaxFrequency()));
        }

        return view;

    }
}
