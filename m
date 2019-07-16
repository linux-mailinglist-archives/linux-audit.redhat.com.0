Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 9119B6AD87
	for <lists+linux-audit@lfdr.de>; Tue, 16 Jul 2019 19:17:06 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A585281F19;
	Tue, 16 Jul 2019 17:17:04 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4763F600C8;
	Tue, 16 Jul 2019 17:17:04 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6FBFC1800207;
	Tue, 16 Jul 2019 17:17:03 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x6GHGxDc008677 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 16 Jul 2019 13:16:59 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A39E760C6D; Tue, 16 Jul 2019 17:16:59 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx16.extmail.prod.ext.phx2.redhat.com
	[10.5.110.45])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9C4E260C70
	for <linux-audit@redhat.com>; Tue, 16 Jul 2019 17:16:52 +0000 (UTC)
Received: from sonic303-27.consmr.mail.ne1.yahoo.com
	(sonic303-27.consmr.mail.ne1.yahoo.com [66.163.188.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4354130C1325
	for <linux-audit@redhat.com>; Tue, 16 Jul 2019 17:16:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
	t=1563297410; bh=u7sAiRpyCpmW2BJzOS7brURt1AL8q1TjA6vK82WiCVs=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To:From:Subject;
	b=Xk+yS/ZfaWPSIIxEb+/BZSLYATxLCT0WlVGDBuR83TZgxia4zjnd9NcHUEZLl5fUJ2NlaiscRD5pDpGVtm7gRLx9P5hUv/KUIZNiNNs1506zGAyX7/qmAvfFopg6xm/kX0JVbuT7tnQwcdEQHoYcIWaZCw4NKolOXxRJgZKoxIvMqVD7lkY0ML+oZFGKO8eWIvD0q/hjN0R7MtdQN87ZI0U5M7wNx1RZpU4DQ58LamBMOdTR72xyqs3LJA0F3yUqj2avxmh+94RmkkX1I4jIRRXmx8CWtIxBASbikzxnWCoUcOzl2AJvXQs+yUtBSx66eK+1d3cEzxHsjL1GUJkn7A==
X-YMail-OSG: rpGMFisVM1lZdtGkZwhZgnhpuLp2Pol5Ht5VkryeacWQaAY1K0ci4hLxm9UPaD2
	.8pGTxac1HKSN06l6b_cw5Xtc2jcbMPTlvP.2dpoehf3pX3GCMpBUNJVj1x7EX.lTbGJK9gEkLgz
	3tVbfZdnMr7LR.bcx2mo_wEcwjdUlCnRe12k01SETp4skldE1G8gYMEjOVNatpa4p8isplyZXask
	kmJRFDiZqv2D9jfBe65K0YEnuGs2qaQII8mAq7bW8d48iYc9l9IbqL71D0L5Ian1cz6SmkK4CMMD
	_.Q5mSRbgabpTJdwuMfdvYs36titcfRwfCyxo7n3nNWP1w.z6fEfgytrTu0v_tC5GjgkjX1pHl3e
	GPyiETiycpXX_X59w5o38n2ix0E0mLWxq2b5bUeGCo1l19lDvNsrXz85eKixvxpjoPGiCwAA.gfs
	ksgzeEXN6ZOgji1iD7YX1Td84SacAv4iaQeUFE5R1xXinT_yJg.xZa_cjeBGzIXI3VTxnWE_Aep0
	JJ5.elftUHW0wc_uFo5nphqNbGaABe8r.0FpuZk4L.gsgq1OySujTekToECABN3JejQuW_5109Yi
	VZMkwCZ9gQ3wJ1B_HxHtwpsGGlvWKg1l0.XNU8OD7lig6q5SwLcoea.wvAJWexkyta9BOwN1JQSs
	dOSVlGS7Czk2k.pcWsCVjUUiPVpFX0maIfoRcSGV_ZoPrytoaDakRY.4lboyXEzUnDWwerXxGB4u
	5YQyOtbhglYGPphNSyH46fSNMgGSNacLlS4tOxcNR2.PG4W6nOYcjzOpHO6O0w2b2QcR.EGxcM8Y
	ZIfMuV2VHG6zasYKTWDumrPnvORBPFHNMMLGmA7ojVnzbLU2gVGFEeqOcoTqwzjZQewuLIEjJ2W1
	oypL0k_SWDMHu6mcQu2Yx2rd73XDZQMhhDsOehB3giFveB2nW7YGTAQiDKMoSFmfTbIEtELSerde
	vuPxlPIF3h5OZUOLx_kTP7PM_Q6mQW3xfMVpFjFig2AEzYm3nRAXkEASwbk5S3bwor54kUZadUhm
	1hgmbz3DGu1VG0Ev4FhRGn0hNmDp9qTXch.vZxPUXAYzFCQHEUVkNC3KIK7BAhXRsbEbOLbTNChl
	CbByOwL1X1xtRF9K7BDKo25PS4lfeThElSJwBSTyZIsds2My42c2gfi_PbjsuxTTUHrEk5Vne0W7
	8vVAgpe4wVWrl6RXmSwhgqSR9645VXgxOI5BFRzGZ4lshd0kocgK5FFzBFAjJt_eVeQHkACmU3PW
	SsmdC3KLI
Received: from sonic.gate.mail.ne1.yahoo.com by
	sonic303.consmr.mail.ne1.yahoo.com with HTTP;
	Tue, 16 Jul 2019 17:16:50 +0000
Received: by smtp431.mail.ne1.yahoo.com (Oath Hermes SMTP Server) with ESMTPA
	ID a05989cbd0d6943daf91831b8336a510; 
	Tue, 16 Jul 2019 17:16:46 +0000 (UTC)
Subject: Re: Preferred subj= with multiple LSMs
To: Steve Grubb <sgrubb@redhat.com>
References: <f824828c-5c9d-b91e-5cec-70ee7a45e760@schaufler-ca.com>
	<1979804.kRvuSoDnao@x2>
	<2802ddee-b621-c2eb-9ff3-ea15c4f19d0c@schaufler-ca.com>
	<3577098.oGDFHdoSSQ@x2>
From: Casey Schaufler <casey@schaufler-ca.com>
Openpgp: preference=signencrypt
Autocrypt: addr=casey@schaufler-ca.com; keydata=
	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
	abzjfg==
Message-ID: <ee64901e-b374-07b6-12b4-5754187d8f70@schaufler-ca.com>
Date: Tue, 16 Jul 2019 10:16:45 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <3577098.oGDFHdoSSQ@x2>
Content-Language: en-US
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.45]); Tue, 16 Jul 2019 17:16:51 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.45]);
	Tue, 16 Jul 2019 17:16:51 +0000 (UTC) for IP:'66.163.188.153'
	DOMAIN:'sonic303-27.consmr.mail.ne1.yahoo.com'
	HELO:'sonic303-27.consmr.mail.ne1.yahoo.com'
	FROM:'casey@schaufler-ca.com' RCPT:''
X-RedHat-Spam-Score: 0.002  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,
	SPF_NONE) 66.163.188.153 sonic303-27.consmr.mail.ne1.yahoo.com
	66.163.188.153 sonic303-27.consmr.mail.ne1.yahoo.com
	<casey@schaufler-ca.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.45
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x6GHGxDc008677
X-loop: linux-audit@redhat.com
Cc: Richard Guy Briggs <rgb@redhat.com>,
	Linux Security Module list <linux-security-module@vger.kernel.org>,
	"linux-audit@redhat.com" <linux-audit@redhat.com>
X-BeenThere: linux-audit@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: Linux Audit Discussion <linux-audit.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-audit>,
	<mailto:linux-audit-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-audit>
List-Post: <mailto:linux-audit@redhat.com>
List-Help: <mailto:linux-audit-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-audit>,
	<mailto:linux-audit-request@redhat.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: linux-audit-bounces@redhat.com
Errors-To: linux-audit-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.25]); Tue, 16 Jul 2019 17:17:05 +0000 (UTC)

On 7/16/2019 9:14 AM, Steve Grubb wrote:
> On Tuesday, July 16, 2019 12:00:05 PM EDT Casey Schaufler wrote:
>>
>> Unless there's an objection I will use this format with
>> a slight modification. Smack allows commas in labels, so
>> using a bare comma can lead to ambiguity.
>>
>> lsms=smack,apparmor subj="TS/Alpha,Beta","a"

Oops! '/' isn't allowed in a Smack label. How embarrassing is that?

>>
>> It's more code change than some of the other options,
>> but if it has the best chance of working with user space
>> I'm game.
> Quoting has a specific meaning in audit fields. So, we really shouldn't do 
> that. We can simply pick another field delimiter. I really don't care which it 
> is as long as its illegal for use in a label. For example, we use 
>
> #define AUDIT_KEY_SEPARATOR 0x01
>
> to separate key fields. We can pick almost anything. (exclamation mark, semi-
> colon, hash, plus symbol, tilde, 0x02, whatever) But it will need to be 
> documented and put into the API so that everyone is aware of the convention.

Unless there's objection I'll document and use '/',

lsms=selinux,apparmor subj=a:b:c:d/a

If there is objection without alternative presented I'll use 0x02,
because no one (I hope) is going to allow that in their label, and
keys have set precedence for unprintable characters.

>
> -Steve
>
>


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
