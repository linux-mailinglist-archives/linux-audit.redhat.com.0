Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 962556091A3
	for <lists+linux-audit@lfdr.de>; Sun, 23 Oct 2022 09:28:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1666510110;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=M4MaIYE7c9RE3iprbBJ0GpAsuLgd5HURNmwdDEOZcik=;
	b=XBg2rihJdD1eTCRbKsJUgOYZAWL7NyU++WnVFQUzKAhXiVoQnFfejY611ghx0/pbDH5+2A
	93LWZj11tyb0Yjg7txbPICVPPVMU1iWFpEyGSg8o8lGJfKN3n5QkoW0GW4Q6DiforzEgYV
	DZeIqiOIWa8ljIHBe31nU0QX6E5SycU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-492-8i4fnQT8Mj2AVlC-sGWX_A-1; Sun, 23 Oct 2022 03:28:27 -0400
X-MC-Unique: 8i4fnQT8Mj2AVlC-sGWX_A-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 092A03804A5B;
	Sun, 23 Oct 2022 07:28:05 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E3F0640C2087;
	Sun, 23 Oct 2022 07:27:51 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 831521946595;
	Sun, 23 Oct 2022 07:27:50 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 844611946586 for <linux-audit@listman.corp.redhat.com>;
 Sun, 23 Oct 2022 07:27:48 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 6887D40C2087; Sun, 23 Oct 2022 07:27:48 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 60DC740C2064
 for <linux-audit@redhat.com>; Sun, 23 Oct 2022 07:27:47 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 903A585A583
 for <linux-audit@redhat.com>; Sun, 23 Oct 2022 07:27:47 +0000 (UTC)
Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-264-MQ57ANDpNzKAdB6VDciMoQ-1; Sun, 23 Oct 2022 03:27:34 -0400
X-MC-Unique: MQ57ANDpNzKAdB6VDciMoQ-1
Received: from fsav118.sakura.ne.jp (fsav118.sakura.ne.jp [27.133.134.245])
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 29N7RFOQ082330;
 Sun, 23 Oct 2022 16:27:15 +0900 (JST)
 (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav118.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav118.sakura.ne.jp);
 Sun, 23 Oct 2022 16:27:15 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav118.sakura.ne.jp)
Received: from [192.168.1.9] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
 (authenticated bits=0)
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 29N7RE9v082325
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Sun, 23 Oct 2022 16:27:14 +0900 (JST)
 (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <a130dc1f-a187-2957-25c1-974fb9c2569f@I-love.SAKURA.ne.jp>
Date: Sun, 23 Oct 2022 16:27:13 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH v38 04/39] LSM: Maintain a table of LSM attribute data
To: Casey Schaufler <casey@schaufler-ca.com>, casey.schaufler@intel.com,
 paul@paul-moore.com, linux-security-module@vger.kernel.org
References: <20220927195421.14713-1-casey@schaufler-ca.com>
 <20220927195421.14713-5-casey@schaufler-ca.com>
 <9907d724-4668-cd50-7454-1a8ca86542b0@I-love.SAKURA.ne.jp>
 <f6b8ac05-6900-f57d-0daf-02d5ae53bc47@schaufler-ca.com>
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
In-Reply-To: <f6b8ac05-6900-f57d-0daf-02d5ae53bc47@schaufler-ca.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2022/10/21 8:42, Casey Schaufler wrote:
> On 10/13/2022 3:04 AM, Tetsuo Handa wrote:
>> On 2022/09/28 4:53, Casey Schaufler wrote:
>>> @@ -483,6 +491,16 @@ void __init security_add_hooks(struct security_hook_list *hooks, int count,
>>>  {
>>>  	int i;
>>>  
>>> +	/*
>>> +	 * A security module may call security_add_hooks() more
>>> +	 * than once. Landlock is one such case.
>>> +	 */
>>> +	if (lsm_id == 0 || lsm_idlist[lsm_id - 1] != lsmid)
>>> +		lsm_idlist[lsm_id++] = lsmid;
>>> +
>>> +	if (lsm_id > LSMID_ENTRIES)
>>> +		panic("%s Too many LSMs registered.\n", __func__);
>> I'm not happy with LSMID_ENTRIES. This is a way towards forever forbidding LKM-based LSMs.
> 
> I don't see any way given the locking issues that we're ever going to
> mix built in security modules and loaded security modules on the same
> hook lists. The SELinux module deletion code is sufficiently scary that
> it is being removed. That does not mean that I think loadable modules
> are impossible, I think it means that their management is going to have
> to be separate, the same way the BPF programs are handled. The only way
> that I see a unified hook list is for all the LSMs to be implemented as
> loadable modules, and I can't see that happening in my lifetime.

I'm not expecting for unloadable LSM modules.
I'm expecting for loadable LSM modules.

I'm not expecting to make all LSM modules to be implemented as loadable
LSM modules, for some want to associate "security label" to everything
(including processes which might start before the global init process starts)
but others do not need to associate "security label" to everything.

> 
> I can see an LSM like BPF, as I mentioned before, that manages loaded
> modules. Over the years I've seen several designs that might work. I'm
> encouraged (and not a little bit frightened) by the success of the BPF
> work.

There can be LSM modules whose lifetime of hooks match the lifetime of
a process which registered hooks for that process. In that case, being
automatically unregistered upon process termination would be preferable.

But there are LSM modules whose lifetime of hooks is irrelevant to a process
which registered a hook for that process. In that case, we need a method for
allowing registered hooks to remain even after that process terminated.

Please don't think loadable LSM modules as something that require special
handling. TOMOYO is an LSM module whose lifetime of hooks is irrelevant to
a process which registered a hook for that process, but does not need to
associate "security label" to everything. It has to be trivial to convert
TOMOYO as a loadable LSM module.

> 
> Converting the array[LSMID_ENTRIES] implementation to a hlist like the
> hooks have used would not be that big a project and I don't see that
> making such a change would be a show-stopper for implementing loadable
> modules. I think that a lot of other issues would be more significant.

Defining constants for each LSM module (i.e. "LSM: Add an LSM identifier
for external use") is the show-stopper for implementing loadable modules.
We won't be able to accept whatever LSM modules to upstream, and we won't
be able to enable whatever LSM modules in distributor kernels.

LSM modules which cannot define a constant due to either "not accepted
to upstream" or "not enabled by distributor kernels" will be forbidden.
I expect that we assign a constant upon module registration (instead of
API visible constants) if we require all LSM modules to have a constant.

> 
> I will, on the other hand, listen to compelling arguments. It is not the
> intention of this code to lock out loadable modules. If I thought it would
> I would not have proposed it.

This code is exactly for locking out loadable modules.

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

