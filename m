Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C2DC2609506
	for <lists+linux-audit@lfdr.de>; Sun, 23 Oct 2022 19:14:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1666545249;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Oodb8PMUo/6JoxFf4AjT6rJswXGzjEplRuM2I50X3qQ=;
	b=E1yir/mpNKPVA9GaE7Ym5Y8QdOb4VCH9YlbogJ5DmOug9JKxlXw7wVdk6khc/hk7kPQ6h4
	2qN251QFNPy7zMh6SBydaaMyGqGnT6BWhh/2cFDxYsvhFCvXfqH0olzyRmRutpo9hXd8w/
	d7HV8UOb9xStrXEQHn2SF6lKCnwJWS8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-90-_uepZdFLMP6KnNPoj7U0Aw-1; Sun, 23 Oct 2022 13:14:07 -0400
X-MC-Unique: _uepZdFLMP6KnNPoj7U0Aw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8CC7B81D9E6;
	Sun, 23 Oct 2022 17:13:59 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 23E151410F38;
	Sun, 23 Oct 2022 17:13:36 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 90E7119465A2;
	Sun, 23 Oct 2022 17:13:24 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 94BC71946587 for <linux-audit@listman.corp.redhat.com>;
 Sun, 23 Oct 2022 17:13:23 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 7A3642166B2F; Sun, 23 Oct 2022 17:13:22 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7345C2166B2A
 for <linux-audit@redhat.com>; Sun, 23 Oct 2022 17:13:22 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B9C40811E7A
 for <linux-audit@redhat.com>; Sun, 23 Oct 2022 17:13:20 +0000 (UTC)
Received: from sonic308-15.consmr.mail.ne1.yahoo.com
 (sonic308-15.consmr.mail.ne1.yahoo.com [66.163.187.38]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_128_GCM_SHA256) id us-mta-300-8d3PTwO6M4GoRAxIbMQYKQ-1; Sun,
 23 Oct 2022 13:13:10 -0400
X-MC-Unique: 8d3PTwO6M4GoRAxIbMQYKQ-1
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1666545189; bh=+p3ZnSwcgxy4h0eesj1r0rUz9ahdEqTxbVmE9pYDmqC=;
 h=X-Sonic-MF:Date:Subject:To:From:From:Subject;
 b=eRrjOXlm+HbcR/UyXjcCgXcukOMX5hqVPTLtXulFPDDBtPvVszRwV9uPZIqCeQnXERBq3WfJvxCgXpeppNpnb808r2X8DuaOCEAAo9NP/nPP73KooV4N9nLNlsgV4E3oiyk+vfUKRpRXF9hmsYI94PNr7FvaqAoBlR+2pWCOmUqEg6BBZCzpukTOnnaC0OO7y7/sHX6s8IIkFLfGwX2I+oAODDCtqC4QIz6mOwWRNef1ARwWR4qF76NuNBzM6Sg+tffvOfbf82O5RUUwyIqMq8xHPkitreUP0HM5DkrD9yUzXA1P2c36fjWAiokFDdoz9EdPtN4kQtkHqBQHzBWVvA==
X-YMail-OSG: fpW0G0oVM1ltKwsEW2ZQxF8m8XcJpDCkM3T0qJa_ZE2ezscGIVqIm6ji3Eq50hi
 G4bQqOQDHg1B.SqwA1Sy5Z7r8uZ8jpzulvaoBxKdk1VB6vh2xTJqdsCE6f0tU7YVUAzR5wNT6TEe
 uexnOOz7q5tENOyO5ss8LxRTU27qNR4BYqc4fboQhfSG2giC1VYQevYDQEH54rqLo_MvmXyWuhnx
 t5Cwq0AWAoH4cYtmK7ibbUzP98TqkzugBQ2cOufV_kVLlzPP1hKeQYf_CbpKsQwvtT9Jneqj1CoC
 jq1yiTnPdvwCroEjGwgozyIeka598mfeyRu1t4Z8OOSTJ4zXkqcwxT6wdnJ4F5sJqWQi_4jlaG71
 KNRMvpm0B.2SCgvU__enbGRq_mnSyITv_vgg0gYmQy_Qi.9aZZPBopyXmHTNmD.aY1WlY0xyOLso
 m_1HIg7IomYn_itAsjofdvSc9rHrPEhdg1jEWo7rZ6qRc2iJKT2eIy0HbS9V9Y7QMuDKKnADyJFo
 fB6FKCl9FbCZzb6ebtV.ITPBzRc4dfVWx1rLYpT8l_djitDQqbyCkAOJ6Mv2fSJxuR3vNCgc8zGT
 IQTeTAB0ubl99GFpGNxWMMTCo36qYG1167rTRuvIJNlVnci65331IfA7eWxeUwtpWaizj.2MqoAd
 ojiiTIAbObB2pxtAyU_YNqrEWfHjBKBj2tJ18.GI5S64gfa_zhUAJlKhFdltlQZTumtF9OULdU5f
 R1lWJlo0GG_IUGE9UiwHVYKqNOOGGTVkgJv0NItimy5bWmK3n6eguJdi8OZoJVLPpNaIiuRLRWht
 3JHQDW36UBUchhtWD2HUo4YBTug1UXhujlS_mEiuv9ByKsU9ye2A3VwPTIjU_cRsG2_HZKp4O3At
 IuJAx6tOJc0kAhjOllWXE_Kk47ieNxkYkGNht1BNTV4X6FGCQQAe05uXDaAVNp1n5RiHKe8IqhR9
 yTAzbZqBuY8egzLDdf2J2bKXrHOzhV1Zva04Sf.sf25bvavWY2BU1Osw7vrOlDKqv1MxP5bFXHMs
 x1m4.EXO5sRslC0iJUbe2x9SNJko93kLoXumFsJa9p0hu2Ou1wSdSsKfdadTzZ1bytYK09e6tWnA
 Cg7.atX_khe4W4wC7DM6uEICwdJX1gYTigWUTG_7VJneiY59QgjQgzm7TTsnw6c2yB6JisaW_cEH
 _37IDIaqYFn3k.eitUAzHrTcqcuVwApXWxW8e0oSyX__wJuhY1py1y2.FqdB6vnC.VMelbZT_9ky
 nJmkAHAhu7HqVGZCmqQtGslu10bOmIcaVoVhC0WMLkQ74vcO.EY6YKtl73yBeonbHDjv2KBAFZT0
 vgx_J3DtgE51C65YUCRwI5eJpQvn3w3q.c49Uy_SvYPhcbuoorkY4EuNt_RtVsdW5qnDBE8wtxRy
 s7cPaE6XwnDt7e2ji07SGfQb0z3Wat9ngjKdO6xVqQxkY1oEStwgRRfrNdnw0LGCT29cSOkmwbaM
 L52QylCR4j40tIyBkTZyUCSdMfMzsxlXc5peUpXGssQPGXAn0mMG95GG0LIcPkI0X1aT1ostl1.6
 6ncTfrAiao.i9A_z.70eFpd7p23XmHI5_9vVdmS7GB6pbjvSBDZFY_vRkFv4lFc9Lov.cW3PrVxd
 GFLGr9vb.d8xaB1U0tL0YvoppJgthMseEuCx09sZZI8dKn4t2wt6JDYcL_JbsgqdTxZwGWuVLafp
 SnvUKOl91r2dBDUphqkU2JQlBsOI1gYW2ML9BFAGzlcFZMT4lDq7P0h1gFFuBfSu9jd4O2ebLcF7
 ONKBEx9RDm11DrHqoJjYwhEpv8A4GgjsffrT0CvngbjGvnGedOgixoC9DpQI4YgKIvypzzqQUSYN
 9.kygyO9rc2FHWdr6GEHT4vRjrPVWrW_6qZap12g6idYyXBsUbYTZKgLYjO6jsNpVHUXZx38fNnp
 o59lnmoaJmEooJQ.UU92WaN1VZ6jjNY0RhWoNke4LUMFQ3hOOhiD.Cp.ssjYloQusp.7vOrEXs9j
 swdMJNeGUOsStblNn19mYbn3FmhDKviwpo8PhoInx88PFXfgtKCrcVuFRRKJRUWeTqXf7elL3xpf
 hRT5zim0qwlpHRFdalTKLS4M9G.yAhl7Kjivft82r1epyV.G4Q9Pe807gakxJ3PXl1_zu4peqYx1
 .A9InxnkxnzzCyTta_9OGnnKF1oxWYuYXKJZzn29tFD.J.OUL2oWG5sIis7o.BOu.fOHebrLFV51
 _iBIUvUJzRAwAMB67fl2Y5Ih4DncjgO3O
X-Sonic-MF: <casey@schaufler-ca.com>
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic308.consmr.mail.ne1.yahoo.com with HTTP; Sun, 23 Oct 2022 17:13:09 +0000
Received: by hermes--production-gq1-754cb59848-jk2dx (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 9e41f289b41449c896e30f1148424ab0; 
 Sun, 23 Oct 2022 17:13:05 +0000 (UTC)
Message-ID: <753dfbe8-c68c-5e16-c4d0-1e14cd831c2e@schaufler-ca.com>
Date: Sun, 23 Oct 2022 10:13:03 -0700
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
From: Casey Schaufler <casey@schaufler-ca.com>
In-Reply-To: <a130dc1f-a187-2957-25c1-974fb9c2569f@I-love.SAKURA.ne.jp>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
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

On 10/23/2022 12:27 AM, Tetsuo Handa wrote:
> On 2022/10/21 8:42, Casey Schaufler wrote:
>> On 10/13/2022 3:04 AM, Tetsuo Handa wrote:
>>> On 2022/09/28 4:53, Casey Schaufler wrote:
>>>> @@ -483,6 +491,16 @@ void __init security_add_hooks(struct security_hook_list *hooks, int count,
>>>>  {
>>>>  	int i;
>>>>  
>>>> +	/*
>>>> +	 * A security module may call security_add_hooks() more
>>>> +	 * than once. Landlock is one such case.
>>>> +	 */
>>>> +	if (lsm_id == 0 || lsm_idlist[lsm_id - 1] != lsmid)
>>>> +		lsm_idlist[lsm_id++] = lsmid;
>>>> +
>>>> +	if (lsm_id > LSMID_ENTRIES)
>>>> +		panic("%s Too many LSMs registered.\n", __func__);
>>> I'm not happy with LSMID_ENTRIES. This is a way towards forever forbidding LKM-based LSMs.
>> I don't see any way given the locking issues that we're ever going to
>> mix built in security modules and loaded security modules on the same
>> hook lists. The SELinux module deletion code is sufficiently scary that
>> it is being removed. That does not mean that I think loadable modules
>> are impossible, I think it means that their management is going to have
>> to be separate, the same way the BPF programs are handled. The only way
>> that I see a unified hook list is for all the LSMs to be implemented as
>> loadable modules, and I can't see that happening in my lifetime.
> I'm not expecting for unloadable LSM modules.
> I'm expecting for loadable LSM modules.
>
> I'm not expecting to make all LSM modules to be implemented as loadable
> LSM modules, for some want to associate "security label" to everything
> (including processes which might start before the global init process starts)
> but others do not need to associate "security label" to everything.
>
>> I can see an LSM like BPF, as I mentioned before, that manages loaded
>> modules. Over the years I've seen several designs that might work. I'm
>> encouraged (and not a little bit frightened) by the success of the BPF
>> work.
> There can be LSM modules whose lifetime of hooks match the lifetime of
> a process which registered hooks for that process. In that case, being
> automatically unregistered upon process termination would be preferable.
>
> But there are LSM modules whose lifetime of hooks is irrelevant to a process
> which registered a hook for that process. In that case, we need a method for
> allowing registered hooks to remain even after that process terminated.
>
> Please don't think loadable LSM modules as something that require special
> handling. TOMOYO is an LSM module whose lifetime of hooks is irrelevant to
> a process which registered a hook for that process, but does not need to
> associate "security label" to everything. It has to be trivial to convert
> TOMOYO as a loadable LSM module.

I don't see that having a built-in version of TOMOYO and a loadable version
needs to be difficult. That's something that whoever creates the loadable
security module scheme is going to have to address. It will depend on the
details of the loadable module mechanism. I can't comment on how that will
work because I don't see loadable modules hitting the top of my queue.

>
>> Converting the array[LSMID_ENTRIES] implementation to a hlist like the
>> hooks have used would not be that big a project and I don't see that
>> making such a change would be a show-stopper for implementing loadable
>> modules. I think that a lot of other issues would be more significant.
> Defining constants for each LSM module (i.e. "LSM: Add an LSM identifier
> for external use") is the show-stopper for implementing loadable modules.

One possible way for loadable modules to work would be to have a built-in
module LSM_ID_MODLOADER which maintains its own list of module hooks.
The values returned from lsm_self_attr() would identify the this LSM
and the data value would have to identify the loaded module it refers to,
perhaps as "TOMOYO=XYZ" or "datastate=foobar". A flag LSM_ATTR_LOADED would
indicate that the attribute needed to be processed according to loadable
module attribute rules, whatever they might be.

So no, it's not a show stopper. Not any more than u32 secids are a showstopper
for process attributes it audit records. LSM IDs are inconvenient, and not my
first choice, but I'm not going to let that get in the way of getting this
code upstream.  

> We won't be able to accept whatever LSM modules to upstream, and we won't
> be able to enable whatever LSM modules in distributor kernels.

A built in module loader security module would address this issue.
Getting such a module accepted upstream is not going to be trivial,
but the BPF people seem to have managed it.

> LSM modules which cannot define a constant due to either "not accepted
> to upstream" or "not enabled by distributor kernels" will be forbidden.
> I expect that we assign a constant upon module registration (instead of
> API visible constants) if we require all LSM modules to have a constant.

Maybe the thing to do is rewrite TOMOYO in eBPF. If I wanted to have a
loadable security module I could either take ten years or so to get a
loadable module scheme upstream in addition to my module, or I could
write it in eBPF and use it the next day. I don't know enough about eBPF
programming to say if it has everything TOMOYO needs, but it sure looks
like an easier path if it does.

>> I will, on the other hand, listen to compelling arguments. It is not the
>> intention of this code to lock out loadable modules. If I thought it would
>> I would not have proposed it.
> This code is exactly for locking out loadable modules.

I hope that I have suggested viable (if not convenient) alternatives.
I suppose it is possible that locking out loadable modules is one
motivation behind the LSM ID scheme, but I really doubt it. And more
importantly, as I've outlined above, I can't be successful in locking
out loadable security modules. I don't even see it as an additional
complication.


--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

