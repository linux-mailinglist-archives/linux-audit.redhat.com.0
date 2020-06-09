Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id E5F431F4281
	for <lists+linux-audit@lfdr.de>; Tue,  9 Jun 2020 19:37:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1591724227;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=BvWwE+E9d6MJXBoP8I0Ysqx5k2zfH5uVtnopqfSP99g=;
	b=BZd4v/P+jnwJKM+n+SMbguPDeBK5ZpWm36vmiyvKEKuCLkC4c8PU1o4WuWIQFsP8ooeZkx
	eSm3JzBwHbPbMYAfWCwbnMok34Sm9/PdbLuKpAppr/8bRR/k2vuAnICbISlP2O4G/wEGxN
	AInfXRM7PeB9XJE81jm5n1KwP1S7Kzo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-503-jZvBPi0_PCaBu5SJETx_Vw-1; Tue, 09 Jun 2020 13:37:05 -0400
X-MC-Unique: jZvBPi0_PCaBu5SJETx_Vw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AB8EBA0C06;
	Tue,  9 Jun 2020 17:36:58 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5252D89293;
	Tue,  9 Jun 2020 17:36:58 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9A096B349E;
	Tue,  9 Jun 2020 17:36:57 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 059HZKj4001030 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 9 Jun 2020 13:35:20 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E2FA819D82; Tue,  9 Jun 2020 17:35:20 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from x2.localnet (ovpn-113-152.phx2.redhat.com [10.3.113.152])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7B92F19D71;
	Tue,  9 Jun 2020 17:35:14 +0000 (UTC)
From: Steve Grubb <sgrubb@redhat.com>
To: Richard Guy Briggs <rgb@redhat.com>
Subject: Re: [PATCH v3] IMA: Add audit log for failure conditions
Date: Tue, 09 Jun 2020 13:35:14 -0400
Message-ID: <2006844.2enhIMKrvE@x2>
Organization: Red Hat
In-Reply-To: <20200609171555.itbllvtgjdanbbk7@madcap2.tricolour.ca>
References: <20200608215343.4491-1-nramas@linux.microsoft.com>
	<518a51b7-6c8d-f55f-c73a-b15abae8e0af@linux.microsoft.com>
	<20200609171555.itbllvtgjdanbbk7@madcap2.tricolour.ca>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: linux-audit@redhat.com
Cc: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>,
	linux-integrity@vger.kernel.org, linux-audit@redhat.com,
	linux-kernel@vger.kernel.org, zohar@linux.ibm.com
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tuesday, June 9, 2020 1:15:55 PM EDT Richard Guy Briggs wrote:
> On 2020-06-09 10:00, Lakshmi Ramasubramanian wrote:
> > On 6/9/20 9:43 AM, Steve Grubb wrote:
> > > > The number in parenthesis is the error code (such as ENOMEM, EINVAL,
> > > > etc.) IMA uses this format for reporting TPM errors in one of the
> > > > audit
> > > > messages (In ima_add_template_entry()). I followed the same pattern.
> > > > 
> > > > Would it be better if the value for "cause" is formatted as
> > > > 
> > > > cause=hashing_error_-22
> > > > 
> > > > cause=alloc_entry_-12
> > > 
> > > Neither fit the name=value style that all other events follow. What
> > > would fit the style is something like this:
> > > 
> > > cause=hashing_error  errno=-22
> > > cause=alloc_entry errno=-12
> > > 
> > > Would this be OK? Also, errno is only to illustrate. You can name it
> > > something else as long as there are no use case collisions with our
> > > dictionary of field names.
> > > 
> > > https://github.com/linux-audit/audit-documentation/blob/master/specs/fi
> > > elds/ field-dictionary.csv
> > 
> > I am fine with this.

Thanks, this makes interpreting it a couple lines of code.

> > "errno" is currently not listed in the dictionary of audit message field
> > names (Thanks for the pointer to this one Steve)

It can be easily added.

> > Mimi - please let me know if you have any concerns with adding the
> > "result" code in "errno" field in integrity_audit_msg().
> 
> If it is added, it should be appended to the end of the record since it
> is an existing record format, then in the case of res=1, errno= should
> still be present (not swing in and out) and just contain zero.  (Or
> another value if there is a non-fatal warning?)

This is not a searchable field, so it can go anywhere. If it is searchable, 
ausearch expects ordering of other searchable fields.

-Steve


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

