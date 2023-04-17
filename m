Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5402F6E53EF
	for <lists+linux-audit@lfdr.de>; Mon, 17 Apr 2023 23:34:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1681767262;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=/WMgShz4WnK5zCARo8NrmyoxthWyhj15ELAkzAw2sI8=;
	b=bSkovxynfYbrQLBDVRS0bklvQf+tWDnIvxS+iUU+a03wIEojhoglHYcdFjlmqXyuPV31xs
	F1w0WwOypcBh9En7bfJjbRiu0BiSbgXV7veYjuosYvvO7Yx9pgIkPazZ8NG+ALNCLrWI+V
	/BE3IasN3SHzyEnyPVMZu4i8pARt89k=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-235-dZbtTBtINiuWFUjfMo726A-1; Mon, 17 Apr 2023 17:34:18 -0400
X-MC-Unique: dZbtTBtINiuWFUjfMo726A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5CA131C0514F;
	Mon, 17 Apr 2023 21:34:16 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3641E40C6E6E;
	Mon, 17 Apr 2023 21:34:10 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id CFAA619465B2;
	Mon, 17 Apr 2023 21:34:09 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 2F004194658C for <linux-audit@listman.corp.redhat.com>;
 Mon, 17 Apr 2023 21:18:32 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 04AC62166B29; Mon, 17 Apr 2023 21:18:32 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F0EB32166B26
 for <linux-audit@redhat.com>; Mon, 17 Apr 2023 21:18:31 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D3B011C0514F
 for <linux-audit@redhat.com>; Mon, 17 Apr 2023 21:18:31 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182]) by
 relay.mimecast.com with ESMTP id us-mta-50-fZCVH-MjOIu9vMlwX7-4Qw-1; Mon,
 17 Apr 2023 17:18:28 -0400
X-MC-Unique: fZCVH-MjOIu9vMlwX7-4Qw-1
Received: by linux.microsoft.com (Postfix, from userid 1052)
 id C4C642121EDA; Mon, 17 Apr 2023 14:18:26 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com C4C642121EDA
Date: Mon, 17 Apr 2023 14:18:26 -0700
From: Fan Wu <wufan@linux.microsoft.com>
To: Paul Moore <paul@paul-moore.com>
Subject: Re: [RFC PATCH v9 05/16] ipe: add userspace interface
Message-ID: <20230417211826.GA6475@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
References: <1675119451-23180-1-git-send-email-wufan@linux.microsoft.com>
 <1675119451-23180-6-git-send-email-wufan@linux.microsoft.com>
 <CAHC9VhRa+NwKzLfQBmHfMgUp6_d5soQG7JBq-Vn=MUeUAt4tuQ@mail.gmail.com>
 <20230410191035.GB18827@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
 <CAHC9VhQDvWDshaZvJrHmjcwyHFxv9oYTN9bn0xiTtFZQRp+GPg@mail.gmail.com>
 <20230412233606.GA16658@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
 <CAHC9VhTs3Njfg=1baQ6=58rPLBmyB3cW0R-MfAaEcRF-jAaYBw@mail.gmail.com>
 <20230417180605.GA402@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
 <CAHC9VhSnKbhtgFxOAY7NYZyOkV4kEA0=mVsCyogLBSCJs0r_ig@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHC9VhSnKbhtgFxOAY7NYZyOkV4kEA0=mVsCyogLBSCJs0r_ig@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mailman-Approved-At: Mon, 17 Apr 2023 21:34:08 +0000
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
Cc: axboe@kernel.dk, linux-block@vger.kernel.org, tytso@mit.edu,
 dm-devel@redhat.com, corbet@lwn.net, roberto.sassu@huawei.com,
 Deven Bowers <deven.desai@linux.microsoft.com>, linux-doc@vger.kernel.org,
 snitzer@kernel.org, jmorris@namei.org, zohar@linux.ibm.com,
 linux-kernel@vger.kernel.org, ebiggers@kernel.org,
 linux-security-module@vger.kernel.org, linux-audit@redhat.com,
 eparis@redhat.com, linux-fscrypt@vger.kernel.org,
 linux-integrity@vger.kernel.org, agk@redhat.com, serge@hallyn.com
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: linux.microsoft.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Apr 17, 2023 at 04:16:29PM -0400, Paul Moore wrote:
> On Mon, Apr 17, 2023 at 2:06???PM Fan Wu <wufan@linux.microsoft.com> wrote:
> > On Thu, Apr 13, 2023 at 02:45:07PM -0400, Paul Moore wrote:
> > > On Wed, Apr 12, 2023 at 7:36???PM Fan Wu <wufan@linux.microsoft.com> wrote:
> > > > On Tue, Apr 11, 2023 at 05:45:41PM -0400, Paul Moore wrote:
> > > > > On Mon, Apr 10, 2023 at 3:10???PM Fan Wu <wufan@linux.microsoft.com> wrote:
> > > > > > On Thu, Mar 02, 2023 at 02:04:42PM -0500, Paul Moore wrote:
> > > > > > > On Mon, Jan 30, 2023 at 5:58???PM Fan Wu <wufan@linux.microsoft.com> wrote:
> > >
> > > ...
> > >
> > > > > I guess this does make me wonder about keeping a non-active policy
> > > > > loaded in the kernel, what purpose does that serve?
> > > > >
> > > >
> > > > The non-active policy doesn't serve anything unless it is activated. User can
> > > > even delete a policy if that is no longer needed. Non-active is just the default
> > > > state when a new policy is loaded.
> > > >
> > > > If IPE supports namespace, there is another use case where different containers
> > > > can select different policies as the active policy from among multiple loaded
> > > > policies. Deven has presented a demo of this during LSS 2021. But this goes
> > > > beyond the scope of this version.
> > >
> > > Do you plan to add namespace support at some point in the
> > > not-too-distant future?  If so, I'm okay with keeping support for
> > > multiple policies, but if you think you're only going to support one
> > > active policy at a time, it might be better to remove support for
> > > multiple (inactive) policies.
> > >
> > > --
> > > paul-moore.com
> >
> > Another benefit of having multiple policies is that it provides isolation
> > between different policies. For instance, if we have two policies named
> > "policy_a" and "policy_b," we can ensure that only team a can update "policy_a,"
> > and only team b can update "policy_b." This way, both teams can update
> > their policy without affecting others. However, if there is only one policy
> > in the system, both teams will have to operate on the same policy, making it
> > less manageable.
> 
> That only really matters if both policies are active at the same time;
> if only one policy can be active at one point in time the only
> permission that matters is the one who can load/activate a policy.
> 
> Allowing for multiple policies complicates the code.  If there is
> another feature that requires multiple policies, e.g. IPE namespaces,
> then that is okay.  However, if there is no feature which requires
> multiple active policies, supporting multiple loaded policies only
> increases the risk of an exploitable bug in the IPE code.
> 
> > Besides, removing multiple (inactive) policies support will
> > render the policy_name field meaningless, and we should only audit the policy
> > hash. I am fine if we decide to go for the single policy option.
> 
> Once again, I think it comes back to: do you still want to support IPE
> namespaces at some point in the future, and if so, when do you expect
> to work on that?
> 

Yes, absolutely! We definitely have plans to support namespaces in the future.
However, it's worth mentioning that there are other tasks that we may need
to prioritize due to their relatively lower complexity. For example, before
we can fully implement namespaces, we need to address some other important
aspects of the system, such as adding a policy language for integrity
enforcement on configuration files and defining trusted certificates
that can sign the root hash. Therefore, the timeline for implementing
namespaces will depend on the completion time of these tasks.

I understand your concerns, and we can proceed with a single policy design
for the initial version.

-Fan

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

