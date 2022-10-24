Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A57A960B1D5
	for <lists+linux-audit@lfdr.de>; Mon, 24 Oct 2022 18:38:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1666629532;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=UDzwl/vToPj+aB2HL9u/HBCTfYPdsllJnJA0wWmPce8=;
	b=YbJf/TeMBGpbHU5gSTQ6gRNIpPU5Q+0CP7e+sD+4Hnd1zREbDdhbN/j2sqtPU1YU+xgH1f
	fktqohIsliah6aUuGmwh0yJsbLBjZ7mAYAd4nASY0Pfm/1rAUGocEu8yJcjy1eJi9OHykc
	F6txBp6V4Hoy+HqEbl6j/P+yThy9yBE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-473-B58mLBUHNR240Qzd097LUA-1; Mon, 24 Oct 2022 12:38:51 -0400
X-MC-Unique: B58mLBUHNR240Qzd097LUA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 846968058E0;
	Mon, 24 Oct 2022 16:38:47 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5AAF71415114;
	Mon, 24 Oct 2022 16:38:34 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 6911F19465A2;
	Mon, 24 Oct 2022 16:38:20 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 2C1AF194658D for <linux-audit@listman.corp.redhat.com>;
 Mon, 24 Oct 2022 16:38:15 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 170FDC1908E; Mon, 24 Oct 2022 16:38:14 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0EE8FC15BB2
 for <linux-audit@redhat.com>; Mon, 24 Oct 2022 16:38:13 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 191FF1C0878E
 for <linux-audit@redhat.com>; Mon, 24 Oct 2022 16:38:03 +0000 (UTC)
Received: from sonic304-27.consmr.mail.ne1.yahoo.com
 (sonic304-27.consmr.mail.ne1.yahoo.com [66.163.191.153]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_128_GCM_SHA256) id us-mta-670-NSxN1kivNX6fhwrIJbyCQQ-1; Mon,
 24 Oct 2022 12:38:01 -0400
X-MC-Unique: NSxN1kivNX6fhwrIJbyCQQ-1
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1666629479; bh=WpC++UFd34kqAk5mPRR45KDtyBfk0bsb53cjhuwYh1z=;
 h=X-Sonic-MF:Date:Subject:To:From:From:Subject;
 b=PT6j3Ab6oezHB5zEPbdK9qtzzYGnT22YGnwo5DNkAmCjJAft4GeGVtV9UqHYYfxT9ajTV5o5TCN09dDcynBMHRlTXKiItIa0GHqz4t8PmBhL6Df+CHKzZcatw8zdTLmStFLcTyAJ0H2X/BaS1Zds/8gBB0ffslIuLlD/uV9JC5Bc1YVFxBJIijTFm4szhw7LHDtQmJFlWcRQRxr3frYOWtmlURRAZ3PgaHmGoJOmXs3Lr8XKQQsRfjRjMdM9IODnPDvqZQCI5XZjjc1nKCOAc/67g3jq5rDbYGkZOSbI2uTu7SpqDuLvM75bZQacE1xBQGF+1q5SO7+gAPnT7+AmJA==
X-YMail-OSG: J8HWP4UVM1nGpUS5AmxMkV4j73seysqQ98z.9Fj_8Et08JH6LbQRPtmdQKGiZ1e
 azuOvKeEKOESAAzK0MM1ttHWzE.PONfcFzmrSXnppiDZbLgOsPlXU7d1nEy6_bT8iSKZH.7klbWS
 Y5.Cef1lBjAG_PpwqGsqXqGsjnc42wwG_3jFIkvH8pYMtQ_5VI6qV.nbC7AorMWxE7JwUUuY86wo
 Pm9NBCpEn_QJFXeUdZx5jIVKUXllUxSMsiB9hWoocn8ARnhtSp_HGbPn.F4s9Nn_hGgZmN7QdUEV
 jlIY4ZFmn.ArZdgkSZxNDIEmHhp.gFSdSGc0hSHR1asjq7JrpOgXatwBwyzqOb8oIl0dW5SH3Gnl
 ZypFZgxyx43Bz4d5fh.oU3iuHVwgRJbJe83qNho7heTqYLAOH86I1ONy6M2i0Sisff1LNHYmDHBP
 P9ypCTEgWFtGHT2._xXGA847V29xTujiXPQm4QZsOfJ_b0egOAbmItA1bYL65HJr9jJv3z66EzwS
 TQSHf7b4rBiTjieIYIzbMw2f0MNtHLhAdObn8C.tDd1H5prC9te9ioqC4KOk0R.JfoChINvp0jS9
 HN_84Pze4R5joRW1vygiC7hSMLM5l.s3Kxr_.kmKiH8l7exOySK5XxVOcyiuVryimBqZNMjoEx37
 JZPZ1qS.B9Eg5aK9VJXC.E2JoOh.i5PWylVPkzNNB5WZddeLz7WgeyzZT7lTmSjsjfhgNVGHJ.cu
 d._alM4ZnMLNOOC6KA85AXG5mS7PjeS2fh5uey0k0kS6aMpfX5oVfxjRXzJRhdGiTwY8Tc_5BGIY
 y7auZcg2U7qbSZzVW6lyVNF_AafUFpQmw24FTQ0s7XBwm1v2Vfd8.ilB9_9FXifLLfmg_yxY8XfH
 yCTNUaXDhuVF69InwmgbIv1iFREbFcgeCZ3_G2BPEKmGK8Xz4BfiHgSMMp.nxveSizrm2EOWdAmi
 slSHNQEmaqjUDABnnUGh.cumzSo8pzAnEMzEfkOyDW76QOEGxxAgEPqNIYsbU5W306nCZqbR2R2g
 LNMZuAJ6qnpySW1iBnRc0JN8ylbseKumlMSgGCxfLmV0n9JHf2gyOVCrB6rLk1f2q5C7bET0Rzjg
 OpRgZPk6kV05aztcxFNQzyG_YMoS.R2oHDXTWjnwcpP6MZMQ.aDBwxSrJmCwduvvt.pnRoRd3WOA
 Fqxjxm5oEjHxo2suNuowV.uwNeVoUlrsVWJ9.R6knyZYxU7vmNgZaKD3TM6BzoXp3Plgajfl_hnE
 EBtil0RAgW21MbA1eMy97VTHQ4zsvQ7SXGjIwT1aGZpG5ZL5d53a5iA93_rZwQRawW.9p6ZZOUkk
 vsPPcsbSHzg6zFbtmYeFAm58MCxMMJ0U9t5ITpzEoSvuB.oUFsiGzbb1tW33C4vCTxRzjpoQXkby
 HT0K.vXh.1lIoAVt3j2Ai3WTJ1VLgfiVTfxFvKxd69W9Sfyn8K5EHYKNJZbQWS9Px98FM3lc8Ve2
 rNW41qVkbbsPsPY0hq3eD1AIAWhSKNcrttErO1DjUyI.pU5tndcyeiqdzPnv88q4RDGFWfjXOu00
 3omrSu1MPaxhWbnguQIpOXB0Q5Wr1IEWxfazH.Jjx2.GEU1hi9UdkJtjFxIPHa8MaGgeUb8ucNuD
 E489oePmKzxtnFYTKSOzYEnML91UNEzu7WNDB7xESmYEJQ.KJn8QtmiUUc7AaCNJrQPRi0aTwKLn
 XYlMuQomhoJ6H0l2bpmcUUkb64kq.SEtHsnO2JFbhYBv4kylw8VuV8M84rcohqdX.KuBYr8qj9k2
 EAgqTnmsPw2p5scYvn7D11xtYXll5cKS.IZkUVnrSdHPG689I0cB0o5oeWzJcceY4PzEQF3M7Xbx
 sH2TApw4C4UMe3yD90Aaqe7SeOsrgz8k.H2ZA3gWeTQevz33GFFoZoppS_JU5o4XxIevFtaAuZNr
 Z3.aWe60okEpKxgJw_PQQdfmS8AcLP0CPCCc03uhyn9XwJJFKPa9W98fQGZK55qY25bciaFyXbg_
 ZgwxVL_tPWZ97tFiK7vu_lEeLfGTluxnc7Qa.xOgCYilYgtCc0pd.SQz8PA7slCm_5NwN6dsysVd
 FkkY6NrqV1vVVd2jKx_ytzivZSVWEP.34aprmacSfAySBlFrbpalMa02mFwLmbgFBFv6SdG1qZeA
 7fQNIBMF5RrrES7BngWrLvCM4wY4QWwZWRAuYx2uTh5qtHO4Az3hlTEujSdjCWinE8Ggg6Ct06Db
 BvBD6dDmEAjt9HT0yo3cOO_D7FhErCxJQTeNizw--
X-Sonic-MF: <casey@schaufler-ca.com>
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic304.consmr.mail.ne1.yahoo.com with HTTP; Mon, 24 Oct 2022 16:37:59 +0000
Received: by hermes--production-gq1-754cb59848-jk2dx (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID a54f1d304324749febb897fb1b4f2d94; 
 Mon, 24 Oct 2022 16:37:54 +0000 (UTC)
Message-ID: <7263e155-9024-0508-370c-72692901b326@schaufler-ca.com>
Date: Mon, 24 Oct 2022 09:37:52 -0700
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
 <753dfbe8-c68c-5e16-c4d0-1e14cd831c2e@schaufler-ca.com>
 <55f27f99-3a2b-3482-6dc2-12203948dd35@I-love.SAKURA.ne.jp>
From: Casey Schaufler <casey@schaufler-ca.com>
In-Reply-To: <55f27f99-3a2b-3482-6dc2-12203948dd35@I-love.SAKURA.ne.jp>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 10/24/2022 8:13 AM, Tetsuo Handa wrote:
> On 2022/10/24 2:13, Casey Schaufler wrote:
>>> We won't be able to accept whatever LSM modules to upstream, and we won't
>>> be able to enable whatever LSM modules in distributor kernels.
>> A built in module loader security module would address this issue.
>> Getting such a module accepted upstream is not going to be trivial,
>> but the BPF people seem to have managed it.
> How can we guarantee that a built-in module loader security module is
> always built-in ?

You can't. That's up to the distribution. Just like BPF.

>  What I'm insisting is that "warrant the freedom to load
> loadable LSM modules without recompiling the whole kernel".

Since security modules are optional and the LSM infrastructure
itself is optional you can't ensure that any given kernel would
support a loadable security module.

> Sure, we can load LSM modules which were not built into distributor kernels
> if we can recompile the whole kernel". But give me a break, that's a stupid
> opinion for non-kernel developers. People won't replace distributor kernels
> with rebuilt kernels only for enabling LSM modules which were not built into
> distributor kernels.
>
> Quoting from https://lkml.kernel.org/r/7f9ffd77-a329-ab13-857b-f8e34b2bfc77@schaufler-ca.com
>
>   > I'm waiting to see what happens if eBPF security modules
>   > become popular. I can easily see distributions turning the BPF LSM off.
>
> Even if TOMOYO could be rewritten in eBPF (I don't think it is possible), how TOMOYO
> can be loaded into distributor kernels if distributions turn the BPF LSM off ?
>
>   > Before I go any further, I think that the loadable module manager LSM would be
>   > very hard to get upstream.
>
> Not only it will be very hard to get the loadable module manager LSM upstream,
> it will be also very hard to keep the loadable module manager LSM enabled in
> distributor kernels.

That is correct.

>
> Again, how can we guarantee that a built-in module loader security module is
> always built-in ?

Again, you can't. You can't guarantee that the LSM infrastructure is built in.

> What I'm insisting is that "warrant the freedom to load loadable LSM modules
> without recompiling the whole kernel".
>
> Adding EXPORT_SYMBOL_GPL(security_hook_heads) is the only way that can "allow
> LSM modules which distributors cannot support to be legally loaded".

I believe that I've identified an alternative. It isn't easy or cheap.

>
> Any fixed-sized array like lsm_idlist[LSMID_ENTRIES] that defines max capacity
> based on whether that LSM module is built-in will lock out loadable LSM modules.
> Thus, I'm not happy with LSMID_ENTRIES.
>
>
>
> On 2022/10/24 2:20, Casey Schaufler wrote:
>> On 10/23/2022 3:10 AM, Tetsuo Handa wrote:
>>> On 2022/10/23 16:27, Tetsuo Handa wrote:
>>>> On 2022/10/21 8:42, Casey Schaufler wrote:
>>>>> I will, on the other hand, listen to compelling arguments. It is not the
>>>>> intention of this code to lock out loadable modules. If I thought it would
>>>>> I would not have proposed it.
>>>> This code is exactly for locking out loadable modules.
>>>>
>>> Imagine a situation where two individuals independently develop their own
>>> web applications using the same identifier, and then their web applications
>>> started working together with other web applications using that identifier.
>>> When they published their web applications for public and wider use, a problem
>>> that both web applications are already using the same identifier arises.
>>> It is too late to reassign the identifier.
>>>
>>> The same trouble can happen with loadable LSM modules. Unless the upstream kernel
>>> behaves as if a DNS registerer that assigns a unique domainname for whatever web
>>> sites (regardless of whether a web site is for public or not), defining a permanent
>>> constant for LSM module is a way towards locking out loadable LSM modules. And it
>>> is well possible that a loadable LSM module wants to run on older kernels which
>>> do not have LSM id defined yet.
>>>
>>> This "define LSM id as userspace visible constant" is more dangerous than just
>>> reserving some space for future use. You are trying to control all IP addresses
>>> for the sake of only in-tree LSM modules. No, no, no, please don't do that...
>> It's really no more dangerous than using the LSM name. What if two developers
>> implement modules and both name it "belllapadula"? User space won't be able to
>> tell the difference if they base behavior on the module name. That's one thing
>> that a loadable module mechanism is going to need to address that a built-in
>> mechanism doesn't. 
> If the upstream kernel assigns an LSM id for all LSM modules including out-of-tree
> and/or private LSM modules (that's why I described that the upstream kernel behaves
> as if a DNS registerer), we can assign LSM id = 100 to "belllapadula" from A and
> LSM id = 101 to "belllapadula" from B, and both "belllapadula" modules can work
> without conflicts by using LSM id. Of course, this implies that we need to preserve
> unused space in lsm_idlist[LSMID_ENTRIES] etc. for such LSM modules (if we use
> fixed-sized array rather than a linked list).

Of course the upstream kernel isn't going to have LSM IDs for out-of-tree
security modules. That's one of many reasons loadable modules are going to
have to be treated differently from built-in modules, if they're allowed
at all.

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

