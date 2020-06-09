Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 927081F41FE
	for <lists+linux-audit@lfdr.de>; Tue,  9 Jun 2020 19:16:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1591722982;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=CETtZqsEpejmH2kl9llBScdygTi4LOMUesJP+kuw05U=;
	b=f9BBjV8jpxVBFR7+9dM40MCctAuJ9v6fPyxIFaX7F/IiUI5wDQEd2l4aV3588sj508/3zp
	VxK0VSHCJGASnta2vYYUy9vIvZn8H6ZL+gV0EnNiuj9u/7UXteuAJuZiMJMs32nwqpQpyK
	bzE/5TZnjE4AI/oe9mG6YJqlYMHNics=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-144-s1ivtEGMOd6o_HFpdhYUYQ-1; Tue, 09 Jun 2020 13:16:19 -0400
X-MC-Unique: s1ivtEGMOd6o_HFpdhYUYQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CFC761005512;
	Tue,  9 Jun 2020 17:16:13 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 56375768DA;
	Tue,  9 Jun 2020 17:16:13 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 23155B349D;
	Tue,  9 Jun 2020 17:16:11 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 059HG8at030847 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 9 Jun 2020 13:16:08 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 69B675D9E8; Tue,  9 Jun 2020 17:16:08 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (unknown [10.10.110.54])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B39625D9E4;
	Tue,  9 Jun 2020 17:15:58 +0000 (UTC)
Date: Tue, 9 Jun 2020 13:15:55 -0400
From: Richard Guy Briggs <rgb@redhat.com>
To: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
Subject: Re: [PATCH v3] IMA: Add audit log for failure conditions
Message-ID: <20200609171555.itbllvtgjdanbbk7@madcap2.tricolour.ca>
References: <20200608215343.4491-1-nramas@linux.microsoft.com>
	<27448076.Og45N0Lxmj@x2>
	<ada45440-aefd-a4b2-2a3b-c012872e86cb@linux.microsoft.com>
	<3776526.Vj75JV9fuy@x2>
	<518a51b7-6c8d-f55f-c73a-b15abae8e0af@linux.microsoft.com>
MIME-Version: 1.0
In-Reply-To: <518a51b7-6c8d-f55f-c73a-b15abae8e0af@linux.microsoft.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: linux-audit@redhat.com
Cc: linux-integrity@vger.kernel.org, linux-kernel@vger.kernel.org,
	zohar@linux.ibm.com, linux-audit@redhat.com
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 2020-06-09 10:00, Lakshmi Ramasubramanian wrote:
> On 6/9/20 9:43 AM, Steve Grubb wrote:
> 
> > > The number in parenthesis is the error code (such as ENOMEM, EINVAL,
> > > etc.) IMA uses this format for reporting TPM errors in one of the audit
> > > messages (In ima_add_template_entry()). I followed the same pattern.
> > > 
> > > Would it be better if the value for "cause" is formatted as
> > > 
> > >      cause=hashing_error_-22
> > > 
> > >      cause=alloc_entry_-12
> > 
> > Neither fit the name=value style that all other events follow. What would fit
> > the style is something like this:
> > 
> > cause=hashing_error  errno=-22
> > cause=alloc_entry errno=-12
> > 
> > Would this be OK? Also, errno is only to illustrate. You can name it
> > something else as long as there are no use case collisions with our
> > dictionary of field names.
> > 
> > https://github.com/linux-audit/audit-documentation/blob/master/specs/fields/
> > field-dictionary.csv
> 
> I am fine with this.
> 
> "errno" is currently not listed in the dictionary of audit message field
> names (Thanks for the pointer to this one Steve)
> 
> Mimi - please let me know if you have any concerns with adding the "result"
> code in "errno" field in integrity_audit_msg().

If it is added, it should be appended to the end of the record since it
is an existing record format, then in the case of res=1, errno= should
still be present (not swing in and out) and just contain zero.  (Or
another value if there is a non-fatal warning?)

> Sample message:
> 
> [    8.051937] audit: type=1804 audit(1591633422.365:8): pid=1 uid=0
> auid=4294967295 ses=4294967295 subj=system_u:system_r:init_t:s0
> op=measuring_keys cause=hashing_error errno=-22 comm="systemd"
> name=".builtin_trusted_keys" res=0
> 
> thanks,
>  -lakshmi

- RGB

--
Richard Guy Briggs <rgb@redhat.com>
Sr. S/W Engineer, Kernel Security, Base Operating Systems
Remote, Ottawa, Red Hat Canada
IRC: rgb, SunRaycer
Voice: +1.647.777.2635, Internal: (81) 32635

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

