package com.burningriverbitworks.tvbgone;

import android.os.Bundle;
import android.support.annotation.Nullable;
import android.support.v4.app.Fragment;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;

public class TVBGoneFragment extends Fragment {


    public static TVBGoneFragment newInstance() {
        return new TVBGoneFragment();
    }

    @Override
    public View onCreateView(LayoutInflater inflater, @Nullable ViewGroup container, @Nullable Bundle savedInstanceState) {
        return inflater.inflate(R.layout.fragment_tvbgone, container, false);
    }
}
