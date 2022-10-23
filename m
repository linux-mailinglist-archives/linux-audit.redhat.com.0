Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F31260951B
	for <lists+linux-audit@lfdr.de>; Sun, 23 Oct 2022 19:20:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1666545644;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=RJ2iCeZo1qjPtl2VywdMGf0eQqyzg7zihZOMnXC5Z1U=;
	b=N017+HU4UyCzXE3POf0asjJFFORVNvHNuOKtMigTVB3oTMPCTGev5G+wmpi/jEwml/bsVe
	u7wChg4p5WrEp9kpEPi/NY6ALfchVEfKAC7ZH6BaE2wpq4iT4LfrEqtT2S8qEQf+BvDxDb
	w/VVge0b6bhiQ8cFOF/HHJAS2vnPBLs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-5-CWjOQcA9MEGvuuIVBIQRoQ-1; Sun, 23 Oct 2022 13:20:40 -0400
X-MC-Unique: CWjOQcA9MEGvuuIVBIQRoQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 54035800B30;
	Sun, 23 Oct 2022 17:20:38 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C0223200C0CD;
	Sun, 23 Oct 2022 17:20:37 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 2B72C19465A2;
	Sun, 23 Oct 2022 17:20:37 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 5D6E21946587 for <linux-audit@listman.corp.redhat.com>;
 Sun, 23 Oct 2022 17:20:36 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 500571410F38; Sun, 23 Oct 2022 17:20:36 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 47EDA140EBF3
 for <linux-audit@redhat.com>; Sun, 23 Oct 2022 17:20:36 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2CE1C811E67
 for <linux-audit@redhat.com>; Sun, 23 Oct 2022 17:20:36 +0000 (UTC)
Received: from sonic304-27.consmr.mail.ne1.yahoo.com
 (sonic304-27.consmr.mail.ne1.yahoo.com [66.163.191.153]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_128_GCM_SHA256) id us-mta-220-NQTTgZfBME6SCof-ea57EQ-1; Sun,
 23 Oct 2022 13:20:34 -0400
X-MC-Unique: NQTTgZfBME6SCof-ea57EQ-1
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1666545633; bh=XfR9fBSvtmdmN4SsEMmqaigwB+UJyci1c32PTStZ8uG=;
 h=X-Sonic-MF:Date:Subject:To:From:From:Subject;
 b=MVve5IbNTIfzprNULYkfhBgLqTexv3ZE5xgUnRgtxX0rowky5qlwN9hc3uj6S2C/UULbrsfXc5qIBA2Lz3d9WI0OPwmtEpqWMsqFTsVOC1UZaOT9VJGFccWdMBi+OMGk5pnYB05r/MFSwSggXN2QqwCRAIlRWBVgxycl79sh5pB2AwbxfQKtkLWFnp3QqEZtQPq5MdwfanGM7X6zLqII8BC7Hd37KfSnzntUtDWdd43BXivk1RqnLudqylUE6ufW4locwen6okkMlSC7uwsxcU7AamnYTFIVKqcHGQILjJKUbxexo72mMytUFjPVLCkQZMIpTiBpLzDv0EMSe8lw2A==
X-YMail-OSG: fhSSWf4VM1mVpiouRtBKNmFf0UtfHQO0tCsULB51RPVeEB7pTQBBSBCAHNio3Vb
 yXqiebQIR4g8itBwgZjjw.58K1gTDsKOijXy0PIkSU6SjDQfppShUtHy_5yFQE.TY9DsDTtRwhkW
 2Nd3TTMUX8CDn.CHCKaV_TWc1pY1RyuxwkCKXhjyTIFOkpB24gE7EonJLQGjULcGct7iR5.FANB7
 NGU4_zAmYp1pVAFt9adeHRVqwTmqZRx1W0HQB_DLod0xi3VSxA8cle1zGKVqX_0buJpoee49doyh
 BhNsiphMFj.r.mntp_bc.2d.St90tuKe4tP8utyh_T0JjK6SjLS6QsI1QK1BGu_yb_5OUZxknga3
 t8J_ad9ozPgGDvPSHI9XhJ_o8JRNeOwU3WeHr9jYdLSaEe3Lpd6nhyy4btbs6tFmBXLkOzQAaXf2
 4xKXfnwCYegWs0HHK46urYizWB4I2tJE6e2M_1ifGPZiqULuikPffLT.yDdeNpSxz.KeQD55qR9S
 fzafz13okSThR9nk_d9XKVh5POF9nbpT_FFwEdr7sELZCKgFNV1h4WjyIXXn2GzpJGubHLqCjEBc
 ZUYir7NUYlJxalX8y3pveTqfGXotJBoSyAw2CrunDlMX4VPdu5b_3J5FPH06.hyVR5eoFNN0IPhu
 EjZGxvJkcQIV3shssO2J2HDl8dD1MbnFBLEx9yhNaTUAmo9CDPC_wr80cD4MnfJZpur_GzGiK2Im
 q6nTWNIvUl42cYElH5pJmZ8xkLjkzWgyoHDTFE5cc62ZptlNEyiW_EGue46l25oKXaSjKbfgHjsa
 MXsCWk5RVgs2RchCkPbKM7H9HtCeANR2xnXOJm0SGP0SNb3hlaLXVBvwg_kwXHVK78wrJCMNc9bK
 oI_fwjNXgwPcuUgYZarX3Vxmpd7VkPWEltT1I95LX7iq.csH5E9bheA_Qrdb6XP3k63upNc5hn_.
 IvOncug1yQVSWkwKy16Uo25WFVn1dW6OE_fcRWnKkV3_SGx7rR_oHf.zVVf4REkb1F2dm8ZsZEHt
 EsnjbGWoAxGQ2naKoksLOt22ZSNy4jm_2CXkVgkxAWKQy6LzzkCWitIna7JI8NlCmS0VZwTyvTLn
 tcJTjA_lQ1tIJa0.NrMlPB.3gRG_A2kfE02G21nfM8oP1qRWIzxs46mKwtZTbP3r.Igbby5WMTZW
 yGakmx9ePLjQw3aNvBSbpDUIlHCSjLKVdbeufJKNp7t2GktSjwWCyzjHW2PBTaCHlA9OOWJRKPRf
 RUNuXQ8CuJ_KY.v1yFT00t.GoNir.1jSJ08ch9oUXpRXNpRsoOEwWBNeEtlGhTBMnIobsd95dYZU
 lDddVeSiGqJf5i7IPBG_AHyBRdvq.GsWD7YysyVdXc5Su3h7G6kPvXz8E.Xhnyc.5bT7SVrukrsb
 cApNly46jyOvWjt.._YJsVktct3EtpkErBPN5oco8IFn2SQDrEVACQXc_PfGgQhxiQbpfPFT2oXf
 kGbP1Dko8zpY0nKZeX_6uM9MfoNZ7crmoddiySbze05l1PVYi0DEpHntqwqGz0oGwGkvI.MWFMp1
 ilc.PgCNwMkIoA6fLIWT5C7xmIawNruA3tuO4t_75KXbCFNpGMygiCZfLlYpE2FZ_MemJQiL.je4
 yJ3WwESVFaMybrYWl2mtWHNz_ciQU9folX2D48h9LrbT.eoP9GZBaK1oo4zPLOS2zzsGrvN6mpI.
 zVnp5B.WAxM8el7EibvJ918TFn1yfp9mXgdwxrEkkLcLppxU7VmImTSM6DypvqEavvOE0D1kGIqs
 rcODjMOug958Xj27XtxT61TUGzPSR8acM8AiBHcvIpfxS4wOMQLSrSsN30NGRKVWCVYGZc_3F6sS
 OJvmnxDLpUQ846k89NAtlrSXZbS0iT8DfS5H9p0e1pFZg7r3fjYZ2DVtZLZvnq7zVSzV8LA9q3Ec
 194ylFXWEgBUCe55gGvxcSVTPceVaf_oduc1doVnqnxywiR6LoKbtJ5Qk_CrcCezTztimvyDTP43
 qVsSffphJ3GRoZG3PD0Of6BVAsKq_GuL73V9vyHxEEeTKfifJwbHMe3Go1d7C3g2ePUnbztO43Zn
 H8ocaHsjhOkQujIcj4fvgTJ9eXL_IYzOrwLfwlcgjJPeyeEIPQio41woWQdPE0ed6iomfkpNQXg0
 sAPvI8ohs159nlbryFmRG9yWGphARJ2COiOSkEtK3PoARZSO8ZzaS2O0F5ICg8DWMkhoFt53L3yk
 2u.u8ATRNpIUuCdYe1tfTr9.REtkY4MXU4Ge53Il.jyyzJc74eju0XH1cb3earK.FsNlj9E1OuhK
 OZIUSFWvUTRmXZ8N29x5PwGOjPQ--
X-Sonic-MF: <casey@schaufler-ca.com>
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic304.consmr.mail.ne1.yahoo.com with HTTP; Sun, 23 Oct 2022 17:20:33 +0000
Received: by hermes--production-gq1-754cb59848-jk2dx (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 4212e99988c4a8add2e675927158d4c3; 
 Sun, 23 Oct 2022 17:20:31 +0000 (UTC)
Message-ID: <1a92299f-2f0d-02d1-75ee-72de80e1a091@schaufler-ca.com>
Date: Sun, 23 Oct 2022 10:20:29 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v38 04/39] LSM: Maintain a table of LSM attribute data
To: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
 casey.schaufler@intel.com, paul@paul-moore.com,
 linux-security-module@vger.kernel.org
References: <20220927195421.14713-1-casey@schaufler-ca.com>
 <20220927195421.14713-5-casey@schaufler-ca.com>
 <9907d724-4668-cd50-7454-1a8ca86542b0@I-love.SAKURA.ne.jp>
 <f6b8ac05-6900-f57d-0daf-02d5ae53bc47@schaufler-ca.com>
 <a130dc1f-a187-2957-25c1-974fb9c2569f@I-love.SAKURA.ne.jp>
 <280c313e-c826-3b9c-a074-2ead3cf4107f@I-love.SAKURA.ne.jp>
From: Casey Schaufler <casey@schaufler-ca.com>
In-Reply-To: <280c313e-c826-3b9c-a074-2ead3cf4107f@I-love.SAKURA.ne.jp>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-BeenThere: linux-audit@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux Audit Discussion <linux-audit.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-audit>,
 <mailto:linux-audit-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/linux-audit/>
List-Post: <mailto:linux-audit@redhat.com>
List-Help: <mailto:linux-audit-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-audit>,
 <mailto:linux-audit-request@redhat.com?subject=subscribe>
Cc: john.johansen@canonical.com, keescook@chromium.org, selinux@vger.kernel.org,
 jmorris@namei.org, linux-kernel@vger.kernel.org, linux-audit@redhat.com
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 10/23/2022 3:10 AM, Tetsuo Handa wrote:
> On 2022/10/23 16:27, Tetsuo Handa wrote:
>> On 2022/10/21 8:42, Casey Schaufler wrote:
>>> I will, on the other hand, listen to compelling arguments. It is not the
>>> intention of this code to lock out loadable modules. If I thought it would
>>> I would not have proposed it.
>> This code is exactly for locking out loadable modules.
>>
> Imagine a situation where two individuals independently develop their own
> web applications using the same identifier, and then their web applications
> started working together with other web applications using that identifier.
> When they published their web applications for public and wider use, a problem
> that both web applications are already using the same identifier arises.
> It is too late to reassign the identifier.
>
> The same trouble can happen with loadable LSM modules. Unless the upstream kernel
> behaves as if a DNS registerer that assigns a unique domainname for whatever web
> sites (regardless of whether a web site is for public or not), defining a permanent
> constant for LSM module is a way towards locking out loadable LSM modules. And it
> is well possible that a loadable LSM module wants to run on older kernels which
> do not have LSM id defined yet.
>
> This "define LSM id as userspace visible constant" is more dangerous than just
> reserving some space for future use. You are trying to control all IP addresses
> for the sake of only in-tree LSM modules. No, no, no, please don't do that...

It's really no more dangerous than using the LSM name. What if two developers
implement modules and both name it "belllapadula"? User space won't be able to
tell the difference if they base behavior on the module name. That's one thing
that a loadable module mechanism is going to need to address that a built-in
mechanism doesn't. 

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

