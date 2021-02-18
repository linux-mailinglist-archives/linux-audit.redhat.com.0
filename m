Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 0DD2231F1C7
	for <lists+linux-audit@lfdr.de>; Thu, 18 Feb 2021 22:41:27 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-278-GX6M8DsTMWG6N-84neKsSg-1; Thu, 18 Feb 2021 16:41:25 -0500
X-MC-Unique: GX6M8DsTMWG6N-84neKsSg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 54AFE801976;
	Thu, 18 Feb 2021 21:41:20 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B4BD35D766;
	Thu, 18 Feb 2021 21:41:18 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9C73618095CB;
	Thu, 18 Feb 2021 21:41:17 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 11ILeqDP014098 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 18 Feb 2021 16:40:52 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id A428E2126C9E; Thu, 18 Feb 2021 21:40:52 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9E0752166B2D
	for <linux-audit@redhat.com>; Thu, 18 Feb 2021 21:40:50 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8231E805F2D
	for <linux-audit@redhat.com>; Thu, 18 Feb 2021 21:40:50 +0000 (UTC)
Received: from sonic312-30.consmr.mail.ne1.yahoo.com
	(sonic312-30.consmr.mail.ne1.yahoo.com [66.163.191.211]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-283-6YOJAexwNjG-eAgF9aGyfQ-1;
	Thu, 18 Feb 2021 16:40:48 -0500
X-MC-Unique: 6YOJAexwNjG-eAgF9aGyfQ-1
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
	t=1613684447; bh=yyG0q+1vFn+1KKQDF32jwmZBu7BTIZmCpdqy94kBzDL=;
	h=X-Sonic-MF:Subject:To:From:Date:From:Subject;
	b=NvlbvFg7S7n9K0VajQZk/u6UxSjnG2UvkCIW+bFFavKk3nwvLI3cox+QM6EuytasOxQbtMpgOzuWfZn79iWAfsBnBolb1nWKLkzmPMSjTwJ9xHIvBMIDTid8r4tZJRJyxxAlzN6GoN2rI0oJES12niY2xrpOPi4ImODi6dK+h8PTgRmWoYz/ci1dLN6NOXCbQaH4/j0gvBpjUuV23/3dOVasFAo9fwmBB2aT0THrloyDW3iXazBBciDZI55sXj+ts4g82DqtXr5kj1iSPHrylqVFm408Jy6vEm5Hh/J/xuzXLkSTDe4hiyEqcZoTmQb4JwWXIMOfQOxbBwuJ7OJe2A==
X-YMail-OSG: czdh9G4VM1ncE.bHjFYRO5sK6GJgR8A4ytk9r1HxDWr8kFAHXQrxfskXHYh5m_d
	IIo2v7nLNDVhdHx.CJ9nsHefy7BYz8FK6Xqyueq1PTEZQK1C3ENpq7Xp1d4cQqhb7782g8CZgoYr
	US7QT1cbuen8P_C_sogTsLD_Hp1W21qt533gDeGBuPyrcCCsDUdEXgSsrei.Bj8CVibA8Z8ygDW6
	JswK.999zxknUL5vUt_bA3nt5nQKgT8KfGs7xYfLZHaZTp6Nijn38NQ6G4X5Fs.Pgc_N.sNknX4Q
	D8Q2wslK4BiQrE1tRUriV5QvKL3j5tYiqIVwE9C0_9piigkuBA3feftwSPWq6aFAMiwJZRotGxBT
	DkXkHEOQ6Qol67HXkUHlwCiDuwpCX6S68BPWjyiKTVTvQofoUAH9QzANLvxpu7bbdByt4Qsxifqk
	RNHqEzvRopJWX.4ocstyZthfRkmOuuVxafAKydThzs.3WBLp.J9tFJdYfQAgwTRc0EzaDgI3UYMB
	QUZrvFZHGFKlNybWJ14CqZgyDG9QRRZnkcndIc79E98l88BGHeMeqmwrVd4djEgdItiTt1QsPrX8
	f9xbC_Qmf61lmioFuiVu_kX20jbO4QsV6qVW6zkX7SQOklNe35euokppNHq9OOXBU8JyOUOBlNXZ
	MsLOIot99a7Qlb7VrOVsD41BpMf6uKSCMWxEfxqYM4.Kjj2Nj3aw7.ZLZFafIsTwpQXvH9IXsRdQ
	7tOOcrJbzuRPatmFvMk1cvqO6VsbKueSU_VO_XaTkwDgTPuB8E4xULY8Kd3kzOLgM8yndywxiLzZ
	ByeFVJQch2.wgC1QwgZ1X6RLx91Y0ci3HTrrQ6LjMY.u_.Q__nV4GcgOjAp7WQbSCdLP_orELsTG
	smWyx4ely5b_2awyZo7eEL2TJUe2J9aNhAaoOvFlEZd14pP3JQVOxp54WFLJC0P4096tEU58my73
	aHE.DBvxqniIB5WdN3rmRkszaezloeKTWXSJJIZimsI5PZuwAQ1ZTelEzJRqmgiPtIP4pGhZ2GVD
	6g_G5x5_FCOsaM0UbLowB1DYboPgdktJ91gUnqZAJIKM6LQotUBwnHXUyN4rkaRHKH0Ht1ThyzXl
	c2T5ah3smRkHk0rAG4TvJ5zc2.w.x001zeNWEYAVFR3JiHQVZo_q1wjYtLAtGbz.JwJZc4ao4wGY
	dTbmEl76rtPEgqY6p.cQFt.VqKYOTN.w2evZoP1jzGPAQmundC3l4uRyAS5O_0JJAn.sVtdQuHUk
	5rlo21QcxGp8j_UbHqel1G4pEf_6NAWE_l4PC6t5DiH4SLLOZ4l_uEV3aPjyXa3E_ikXmpEUYi1N
	Gu55MWAkfLCvCojCyXEulYAQ6cVtbfLs.miMvHm_h.fAzv9VctmP6xvdOLpYYjur_Q416n5ZXDR_
	mBUQxzYKgybJ34_Zw_LWNc3NrAO3oDgAdafHvYhigmQk5JZkqZ7P9eilRy.Y0mHIGzwcT.LohneX
	gOkxxxLqUMhY0cQkNqMwu79KeA7BJSa4Vu57iUAndYNTgOPQxPZjF9Dat9CCLhzYTednIhLXGI7v
	R1fJM8k1qYGQi6Pk.IpjqqfA37bZsl.bkc8lNsLFbgTj4B2PEGtKDhhX7PH4nFP09bdgUaqA6PUr
	D_Uli8MpsZW27AXYZAPfTw0V8a11kmCE6.WhGAufd1TsSBGp_PHklmeB0TcTJ2G4vtldJ0qzcHbG
	1mhqBQ7JeGgElrWt8J1BJI26yPfxeQ7_sIwqZgAiyBPTe3u6eLgUTvf2f9HbR5IpC1GNDHcaVPIc
	_wR9ytKTFJxXfIWw0f4ak2mWK879AsOEhJIbe0EXv___tCs4iz5dj6.4G2PUw87mAYoYugLRnAnx
	.IQH7hlkJ4a9VVsRscm7ShcgLhbDWc.Y_Mev8AJUL9tYKnYR9oCco_gZq_STmvJVgDd1dcQO_O0K
	RNxbZVgww4ToWK8R5DO8UEmNJnKypyEEyNRcAFe_uK5ezm0rc2L72eNcggXma_KMdO4ULSl9VHmb
	Fd2LFmxy7bNT2FAJ2Nq1A5sivxL4DouzyUrxrWWw5Iy_uO8RjxA7Ce17cY08N_GbOcerZIuyV2w1
	3mGMP8LbYhtlglMTTlXR_wbX47sfvdO5ex0yH3lpzLDkM5e06L_.spfHI9qnU376VDhNRr5dR6r2
	nFtjoU3_2GtSSbh1m8tvs2wqdS5wvzDOkiiUgsNGJNWLjIs60NjxjN2IXo6QTfv5HgH2oE96ICJU
	8sWA9URnXUYqmlErdM.q9NsR9aZYRr9azHkUJGp_VAhwHigzlOfPazZVIOT42lKo1dR1XwzCUAYJ
	whbrA8nSUstRDbaIIDo1A7aAaY1GLoDiEJUzt3QTqCVwjuCTe6IHHBR3GQh83RAOIJ9iemY9UdSl
	M8xbvEYBrdm2Ab6RCnN3s9DMi0_hOSli26OUR8xzDMBqrM9hevkiZcVL569qs2ssxWTnfXZNA4F7
	Zt.8_iMwjmIYvsT1SAEpOxgmdkjusCI86v1lXIwpiqnIYsuVb5AseQC7K4xsRcLonicUdQX1mgjC
	g4VXkSpRwpgf9opcF.jJ_c81Jm6.tSP7pTJ_LQeeYmICy9CKWpR2.NXWkEREAKNrj6Db4gA4V9Dw
	2sEEimflHK_OMXLWAsbszXj8t.iiP
X-Sonic-MF: <casey@schaufler-ca.com>
Received: from sonic.gate.mail.ne1.yahoo.com by
	sonic312.consmr.mail.ne1.yahoo.com with HTTP;
	Thu, 18 Feb 2021 21:40:47 +0000
Received: by smtp415.mail.bf1.yahoo.com (VZM Hermes SMTP Server) with ESMTPA
	ID 27f27257a3f1ca8fd5f2cfd823e318ba; 
	Thu, 18 Feb 2021 21:40:45 +0000 (UTC)
Subject: Re: security_task_getsecid() and subjective vs objective task creds
To: Paul Moore <paul@paul-moore.com>, linux-security-module@vger.kernel.org,
	selinux@vger.kernel.org, linux-audit@redhat.com
References: <CAHC9VhSiq5gqY1bfouia4GwYsE9MGGXnUOqwEtHi2u0-1=8aZQ@mail.gmail.com>
From: Casey Schaufler <casey@schaufler-ca.com>
Message-ID: <a38955de-1a71-ab0c-0cff-d63ea258ca81@schaufler-ca.com>
Date: Thu, 18 Feb 2021 13:40:43 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
	Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <CAHC9VhSiq5gqY1bfouia4GwYsE9MGGXnUOqwEtHi2u0-1=8aZQ@mail.gmail.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 11ILeqDP014098
X-loop: linux-audit@redhat.com
X-BeenThere: linux-audit@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: Linux Audit Discussion <linux-audit.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-audit>,
	<mailto:linux-audit-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/linux-audit>
List-Post: <mailto:linux-audit@redhat.com>
List-Help: <mailto:linux-audit-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-audit>,
	<mailto:linux-audit-request@redhat.com?subject=subscribe>
Sender: linux-audit-bounces@redhat.com
Errors-To: linux-audit-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2/18/2021 11:34 AM, Paul Moore wrote:
> Hi all,
>
> When looking into a problem I noticed that audit was recording the
> wrong subject label for a process.  Doing a bit of digging I realized
> this was caused by the SELinux security_task_getsecid() implementation
> returning the objective security label (taken from task->real_cred),
> and not the subjective security label (taken from task->cred).
>
> Looking around at the other LSMs which implement this hook, Smack and
> AppArmor, it appears they both do the same thing: return the objective
> security ID for the process.  Looking quickly at the various non-LSM
> callers of the security_task_getsecid() hook, it unfortunately looks
> like all of them expect the subjective security ID to be returned.
> The only caller I'm not 100% confident in is binder, but from what I
> can tell it looks like they are expecting the subjective ID too.
>
> At least we are consistently wrong :)

We may have come down with a case of helperitis. 

>
> How do we want to fix this?  The obvious fix is to change the SELinux,
> AppArmor, and Smack security_task_getsecid() implementations to return
> the subjective security ID (->cred), and likely make a note in
> lsm_hooks.h,

That would be my choice.

>  but if someone can see a case where we would need both
> the subjective and objective security labels speak up and we can
> introduce a new hook for the subjective label, and likely add a "_obj"
> to the end of the existing hook to help make it more clear.  If
> neither of those options are acceptable, we could convert all of the
> existing callers to use something like the line below (assumes
> current), but that is the least appealing option as far as I'm
> concerned.
>
>   security_cred_getsecid(current_cred(), &sid);
>
> Opinions?

If the objective cred isn't being used in the access control decision
it seems pointless to add it to the audit record. If there is a case
where the task is being treated as an object, signal delivery comes to
mind, you still want the objective credential. So it seems like care
may be required to ensure that the correct value (sub vs obj) is
used.



--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

