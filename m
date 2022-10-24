Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id F008C60AEDC
	for <lists+linux-audit@lfdr.de>; Mon, 24 Oct 2022 17:19:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1666624783;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=qaE5PvhXo6XkcjL7OUQ2lP3NHi12ZRapg3Zq5Jb8NDE=;
	b=IA/rkOxHnSok8hEy3eaFnhK7i/bc7tMfsZrv+z+D2Zi9Szc82Swg38ib8R9K2Zxhv28yvv
	ky109z6Qdx4X1gBsE5nLIh6FBZF3xMFow2vrfKKbr/ErFoKsU/AwYy9EZjt+U0kqEdqsTY
	SzvU4ook8ZNFsLkJv+6JmJtbBk/rmXs=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-154-rJdqtV_CM7aPdM0XZQGovg-1; Mon, 24 Oct 2022 11:19:42 -0400
X-MC-Unique: rJdqtV_CM7aPdM0XZQGovg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2A26F38012DE;
	Mon, 24 Oct 2022 15:19:40 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D68BD2166B2A;
	Mon, 24 Oct 2022 15:19:34 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id C710819465A2;
	Mon, 24 Oct 2022 15:19:33 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 9DCEF194658D for <linux-audit@listman.corp.redhat.com>;
 Mon, 24 Oct 2022 15:19:32 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 88DBCC04482; Mon, 24 Oct 2022 15:19:32 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 80DC2C0177B
 for <linux-audit@redhat.com>; Mon, 24 Oct 2022 15:19:32 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 65FA0811E87
 for <linux-audit@redhat.com>; Mon, 24 Oct 2022 15:19:32 +0000 (UTC)
Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-624-IEOkSxlAONC_7numPIli5w-1; Mon, 24 Oct 2022 11:19:29 -0400
X-MC-Unique: IEOkSxlAONC_7numPIli5w-1
Received: from fsav115.sakura.ne.jp (fsav115.sakura.ne.jp [27.133.134.242])
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 29OFDhBf078266;
 Tue, 25 Oct 2022 00:13:43 +0900 (JST)
 (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav115.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav115.sakura.ne.jp);
 Tue, 25 Oct 2022 00:13:43 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav115.sakura.ne.jp)
Received: from [192.168.1.9] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
 (authenticated bits=0)
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 29OFDhop078262
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Tue, 25 Oct 2022 00:13:43 +0900 (JST)
 (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <55f27f99-3a2b-3482-6dc2-12203948dd35@I-love.SAKURA.ne.jp>
Date: Tue, 25 Oct 2022 00:13:40 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v38 04/39] LSM: Maintain a table of LSM attribute data
To: Casey Schaufler <casey@schaufler-ca.com>, casey.schaufler@intel.com,
 paul@paul-moore.com, linux-security-module@vger.kernel.org
References: <20220927195421.14713-1-casey@schaufler-ca.com>
 <20220927195421.14713-5-casey@schaufler-ca.com>
 <9907d724-4668-cd50-7454-1a8ca86542b0@I-love.SAKURA.ne.jp>
 <f6b8ac05-6900-f57d-0daf-02d5ae53bc47@schaufler-ca.com>
 <a130dc1f-a187-2957-25c1-974fb9c2569f@I-love.SAKURA.ne.jp>
 <753dfbe8-c68c-5e16-c4d0-1e14cd831c2e@schaufler-ca.com>
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
In-Reply-To: <753dfbe8-c68c-5e16-c4d0-1e14cd831c2e@schaufler-ca.com>
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2022/10/24 2:13, Casey Schaufler wrote:
>> We won't be able to accept whatever LSM modules to upstream, and we won't
>> be able to enable whatever LSM modules in distributor kernels.
> 
> A built in module loader security module would address this issue.
> Getting such a module accepted upstream is not going to be trivial,
> but the BPF people seem to have managed it.

How can we guarantee that a built-in module loader security module is
always built-in ? What I'm insisting is that "warrant the freedom to load
loadable LSM modules without recompiling the whole kernel".

Sure, we can load LSM modules which were not built into distributor kernels
if we can recompile the whole kernel". But give me a break, that's a stupid
opinion for non-kernel developers. People won't replace distributor kernels
with rebuilt kernels only for enabling LSM modules which were not built into
distributor kernels.

Quoting from https://lkml.kernel.org/r/7f9ffd77-a329-ab13-857b-f8e34b2bfc77@schaufler-ca.com

  > I'm waiting to see what happens if eBPF security modules
  > become popular. I can easily see distributions turning the BPF LSM off.

Even if TOMOYO could be rewritten in eBPF (I don't think it is possible), how TOMOYO
can be loaded into distributor kernels if distributions turn the BPF LSM off ?

  > Before I go any further, I think that the loadable module manager LSM would be
  > very hard to get upstream.

Not only it will be very hard to get the loadable module manager LSM upstream,
it will be also very hard to keep the loadable module manager LSM enabled in
distributor kernels.

Again, how can we guarantee that a built-in module loader security module is
always built-in ?

What I'm insisting is that "warrant the freedom to load loadable LSM modules
without recompiling the whole kernel".

Adding EXPORT_SYMBOL_GPL(security_hook_heads) is the only way that can "allow
LSM modules which distributors cannot support to be legally loaded".

Any fixed-sized array like lsm_idlist[LSMID_ENTRIES] that defines max capacity
based on whether that LSM module is built-in will lock out loadable LSM modules.
Thus, I'm not happy with LSMID_ENTRIES.



On 2022/10/24 2:20, Casey Schaufler wrote:
> On 10/23/2022 3:10 AM, Tetsuo Handa wrote:
>> On 2022/10/23 16:27, Tetsuo Handa wrote:
>>> On 2022/10/21 8:42, Casey Schaufler wrote:
>>>> I will, on the other hand, listen to compelling arguments. It is not the
>>>> intention of this code to lock out loadable modules. If I thought it would
>>>> I would not have proposed it.
>>> This code is exactly for locking out loadable modules.
>>>
>> Imagine a situation where two individuals independently develop their own
>> web applications using the same identifier, and then their web applications
>> started working together with other web applications using that identifier.
>> When they published their web applications for public and wider use, a problem
>> that both web applications are already using the same identifier arises.
>> It is too late to reassign the identifier.
>>
>> The same trouble can happen with loadable LSM modules. Unless the upstream kernel
>> behaves as if a DNS registerer that assigns a unique domainname for whatever web
>> sites (regardless of whether a web site is for public or not), defining a permanent
>> constant for LSM module is a way towards locking out loadable LSM modules. And it
>> is well possible that a loadable LSM module wants to run on older kernels which
>> do not have LSM id defined yet.
>>
>> This "define LSM id as userspace visible constant" is more dangerous than just
>> reserving some space for future use. You are trying to control all IP addresses
>> for the sake of only in-tree LSM modules. No, no, no, please don't do that...
> 
> It's really no more dangerous than using the LSM name. What if two developers
> implement modules and both name it "belllapadula"? User space won't be able to
> tell the difference if they base behavior on the module name. That's one thing
> that a loadable module mechanism is going to need to address that a built-in
> mechanism doesn't. 

If the upstream kernel assigns an LSM id for all LSM modules including out-of-tree
and/or private LSM modules (that's why I described that the upstream kernel behaves
as if a DNS registerer), we can assign LSM id = 100 to "belllapadula" from A and
LSM id = 101 to "belllapadula" from B, and both "belllapadula" modules can work
without conflicts by using LSM id. Of course, this implies that we need to preserve
unused space in lsm_idlist[LSMID_ENTRIES] etc. for such LSM modules (if we use
fixed-sized array rather than a linked list).

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

