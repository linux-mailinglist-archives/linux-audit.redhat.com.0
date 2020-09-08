Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 4EBDC2623A4
	for <lists+linux-audit@lfdr.de>; Wed,  9 Sep 2020 01:38:35 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-158-ns4ujCCUPbirwrHsE5HJkA-1; Tue, 08 Sep 2020 19:38:32 -0400
X-MC-Unique: ns4ujCCUPbirwrHsE5HJkA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DA2BA807335;
	Tue,  8 Sep 2020 23:38:25 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0D4F5838A6;
	Tue,  8 Sep 2020 23:38:24 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id F3726183D020;
	Tue,  8 Sep 2020 23:38:19 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 088Nc9oi032028 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 8 Sep 2020 19:38:10 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id BE1442156A2D; Tue,  8 Sep 2020 23:38:09 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B28872166B44
	for <linux-audit@redhat.com>; Tue,  8 Sep 2020 23:38:06 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C1BC2101A53F
	for <linux-audit@redhat.com>; Tue,  8 Sep 2020 23:38:06 +0000 (UTC)
Received: from sonic317-39.consmr.mail.ne1.yahoo.com
	(sonic317-39.consmr.mail.ne1.yahoo.com [66.163.184.50]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-23-pMdzqCq5OGaPmhDysIUFyA-1;
	Tue, 08 Sep 2020 19:38:04 -0400
X-MC-Unique: pMdzqCq5OGaPmhDysIUFyA-1
X-YMail-OSG: jXx5Q5gVM1mOeCClW_YWzKbQovKb74vYDiw06eADfEekYcUOmag75JucEYacJ4V
	y7SCSK9dr7sbnhafAlpAJqSvAoaIc0rDsH0_GIJZZHuYhBNvqmlZAvQ5s3XrSCSt0FHdtJzrYsrW
	NX5XAjTxMOiOHtFoYzV6o.OC_ty8e8qw6uAFrIb4DruvQAEut2cjNiGASDkE6q1Z6HqKgXW206RH
	HZaTMQrG.kBA24VAw41SdCKPmJBYmrb9qujioQ6ofk2cfaAGE0h5rLqw2hMv471XkXlJIvHr0xPO
	S3h1bSaM61VzeaVz9yIEKuSbOoXD8JMk906efD51_Hb9AQLurufStXMEIjm_u6XgrFrP8PjIkOK3
	f5f4FBu8JcLuajBkaPgOe4Ff8LqJyJnyO9L_A9p5du79xy2ATLRXFOB0IPbi81Mp1OSF6eh0Ydhy
	NjeYXvvV3XdgmXPol3Fs3iTC9YQ_isfaFbP5f9xPXi8v2bg8zHMdPzyqLorh508fAJkkwlAh8Gxd
	cwFS.zxLba4610u3ZTguk2kA4TkcN3_HSUxJfmhDG7ar.vjVSq0B21STe8MdN0v9Bq9haNjF91rt
	3ENOvrizqGfUGcLGJjNuPAJrxA_1u69_ZNPLf84iDmDqPCQijpSlL9wjX5ziW1FSaeAp6U4RtcfB
	UZl4j6RSgoScM7xlXW0_86cZlJgx0h_b7vSdlW0W.6OEktNHyqzmOcve0m7.fiLYyjnQPtc_rd4P
	vCFb8iUkTFia5Wcb6T0L4QP7IISybBVstIannuz_lGxZ0XPk.WDFciOfZrVzIkxQZJY4ubxzwt7B
	HM6ydb12kKpamT5G6fKKaud8YOTFyNLJ26zaT5C3wKUhQpmP2SenJuRLWCxPJtagpYm7gBqE6lpg
	UH_MnKmKl403ANZkZxFvnwQws7JgzvWR5.D8btT22gt5CZBmEUPI7877.Ko_JL7t_cH0LDuHh8Ef
	V58_HU2lduXLcDRciPGu1FBaJsUhovy054GZz2vVq6fTvR_HJpFkhHYrqkpoEWt4bUrgUMkm_PfT
	_QXD3vpf6XuuYMw01PVhhHyka34mZc7iZof3Y8sgSvkB.voxAO.0XA0V4rziD2rBbUfmG_ccKnoP
	FnNZCb.X6wqHpcy6apMiLqc3YXFgiM0JcvT55Zpa_EIHuRaLLWO7rGq5dqE5f6j82WvXbvO4Hfle
	MmTYgbbfkYy6TeRsmEgVc5awJJfR7V8.sJKxhalC.4MtE4mz0BFZMT3.tXngpmyc_rHHjBH2zwO8
	UGeEx_7IdHJj5SZtDZciy7LC6I4qP6M2CGutfLft.XaWqCC7goLDaW1pmDzGqTMNFbKlgSk_HUuH
	pib.V9Zn3tz9i7JBm2TSNazm5R2_rbvzlQXnrSnmkFy86EqpRYw4.G8yiOm0bhZTeZSHhPG3b3hH
	SXnECPLtAX0SPD.eNWRHcT7AUZOFvzlDJtGuPpZ2mQUcKhQU94VfJmOLI9V5hH7WHombMmwLPw37
	bhtm.k5fH2g4H2E7J7t.jGgrP.BJwx3Bs56DCsILgHkLD34GPtNq7H0uSjntw1ZPcBuj.cSosfXA
	fEyeAiEzecjLp6Noq3_b_YvlZzB_uV0i62HcG52gOSE1h
Received: from sonic.gate.mail.ne1.yahoo.com by
	sonic317.consmr.mail.ne1.yahoo.com with HTTP;
	Tue, 8 Sep 2020 23:38:03 +0000
Received: by smtp407.mail.gq1.yahoo.com (VZM Hermes SMTP Server) with ESMTPA
	ID d768f3d3f91d38854b63b7a8d98c3f3a; 
	Tue, 08 Sep 2020 23:37:59 +0000 (UTC)
Subject: Re: [PATCH v20 05/23] net: Prepare UDS for security module stacking
To: Stephen Smalley <stephen.smalley.work@gmail.com>,
	John Johansen <john.johansen@canonical.com>
References: <20200826145247.10029-1-casey@schaufler-ca.com>
	<20200826145247.10029-6-casey@schaufler-ca.com>
	<CAHC9VhSh=r4w_3mZOUwmKN0UxCMxPNGKd=_vr_iGV06rvCNbSA@mail.gmail.com>
	<1eeef766-405f-3800-c0cf-3eb008f9673e@schaufler-ca.com>
	<CAHC9VhSf8RWUnRPYLR6LLzbn-cvNg8J0wnZGwTOAe=dOqkvd0g@mail.gmail.com>
	<ef6a049a-c6b9-370b-c521-4594aa73e403@schaufler-ca.com>
	<CAHC9VhSu4qqKWsutm3=GF_pihUKpwjAtc9gAhfjGsGtKfz-Azw@mail.gmail.com>
	<585600d7-70fb-0982-1e6b-ffd7b7c33e32@schaufler-ca.com>
	<9a58d14c-eaff-3acf-4689-925cf08ba406@canonical.com>
	<CAEjxPJ7i5Ruy=NZ+sq3qCm8ux+sZXY5+XX_zJu3+OqFq3d_SLQ@mail.gmail.com>
	<CAEjxPJ5KudgTjhmXBNdCO_ctvioy5UA5PXcoKX4zc19NYKgHZA@mail.gmail.com>
From: Casey Schaufler <casey@schaufler-ca.com>
Message-ID: <c5bef71e-6d78-2058-bcaa-8497c76d7375@schaufler-ca.com>
Date: Tue, 8 Sep 2020 16:37:57 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
	Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <CAEjxPJ5KudgTjhmXBNdCO_ctvioy5UA5PXcoKX4zc19NYKgHZA@mail.gmail.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: linux-audit@redhat.com
Cc: SElinux list <selinux@vger.kernel.org>, James Morris <jmorris@namei.org>,
	LSM List <linux-security-module@vger.kernel.org>, linux-audit@redhat.com,
	Casey Schaufler <casey.schaufler@intel.com>,
	Stephen Smalley <sds@tycho.nsa.gov>
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
Sender: linux-audit-bounces@redhat.com
Errors-To: linux-audit-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Language: en-US

On 9/8/2020 6:35 AM, Stephen Smalley wrote:
> On Mon, Sep 7, 2020 at 9:28 PM Stephen Smalley
> <stephen.smalley.work@gmail.com> wrote:
>> On Sat, Sep 5, 2020 at 3:07 PM John Johansen
>> <john.johansen@canonical.com> wrote:
>>> On 9/5/20 11:13 AM, Casey Schaufler wrote:
>>>> On 9/5/2020 6:25 AM, Paul Moore wrote:
>>>>> On Fri, Sep 4, 2020 at 7:58 PM Casey Schaufler <casey@schaufler-ca.com> wrote:
>>>>>> On 9/4/2020 2:53 PM, Paul Moore wrote:
>>>>>>> On Fri, Sep 4, 2020 at 5:35 PM Casey Schaufler <casey@schaufler-ca.com> wrote:
>>>>>>>> On 9/4/2020 1:08 PM, Paul Moore wrote:
>>>>> ...
>>>>>
>>>>>>> I understand the concerns you mention, they are all valid as far as
>>>>>>> I'm concerned, but I think we are going to get burned by this code as
>>>>>>> it currently stands.
>>>>>> Yes, I can see that. We're getting burned by the non-extensibility
>>>>>> of secids. It will take someone smarter than me to figure out how to
>>>>>> fit N secids into 32bits without danger of either failure or memory
>>>>>> allocation.
>>>>> Sooo what are the next steps here?  It sounds like there is some
>>>>> agreement that the currently proposed unix_skb_params approach is a
>>>>> problem, but it also sounds like you just want to merge it anyway?
>>>> There are real problems with all the approaches. This is by far the
>>>> least invasive of the lot. If this is acceptable for now I will commit
>>>> to including the dynamic allocation version in the full stacking
>>>> (e.g. Smack + SELinux) stage. If it isn't, well, this stage is going
>>>> to take even longer than it already has. Sigh.
>>>>
>>>>
>>>>> I was sorta hoping for something a bit better.
>>>> I will be looking at alternatives. I am very much open to suggestions.
>>>> I'm not even 100% convinced that Stephen's objections to my separate
>>>> allocation strategy outweigh its advantages. If you have an opinion on
>>>> that, I'd love to hear it.
>>>>
>>> fwiw I prefer the separate allocation strategy, but as you have already
>>> said it trading off one set of problems for another. I would rather see
>>> this move forward and one set of trade offs isn't significantly worse
>>> than the other to me so, either wfm.
>> I remain unclear that AppArmor needs this patch at all even when
>> support for SO_PEERSEC lands.
>> Contrary to the patch description, it is about supporting SCM_SECURITY
>> for datagram not SO_PEERSEC.  And I don't know of any actual users of
>> SCM_SECURITY even for SELinux, just SO_PEERSEC.
> I remembered that systemd once tried using SCM_SECURITY but that was a
> bug since systemd was using it with stream sockets and that wasn't
> supported by the kernel at the time,
> https://bugzilla.redhat.com/show_bug.cgi?id=1224211, so systemd
> switched over to using SO_PEERSEC.  Subsequently I did fix
> SCM_SECURITY to work with stream sockets via kernel commit
> 37a9a8df8ce9de6ea73349c9ac8bdf6ba4ec4f70 but SO_PEERSEC is still
> preferred.  Looking around, I see that there is still one usage of
> SCM_SECURITY in systemd-journald but it doesn't seem to be required
> (if provided, journald will pass the label along but nothing seems to
> depend on it AFAICT).  In any event, I don't believe this patch is
> needed to support stacking AppArmor.

Stephen is, as is so often the case, correct. AppArmor has a stub
socket_getpeersec_dgram() that gets removed in patch 23. If I remove
it earlier and throw in a touch of scaffolding for secid_to_secctx()
we can leave the secid as is for now. This can't be the final solution
as AppArmor will be using the hook someday and we still have the all
modules case to worry about for the next phase. It also assumes that
The BPF module isn't going to suddenly sprout a security context.

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

