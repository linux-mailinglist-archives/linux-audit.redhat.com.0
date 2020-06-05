Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 860DB1F0440
	for <lists+linux-audit@lfdr.de>; Sat,  6 Jun 2020 04:51:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1591411866;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=95M2RaWotyAoSai+4wI8wuxL9WQ4zVlnCYUE5TFNRjg=;
	b=IoTC2+l1eA7bzYtLFiBHNKS2V8bmnpwKY2xKYHwMUUZnydyqgGmCCQMjSMvBU4NEhp6lQk
	4lrstE6Yxcx8onxkI8vPlvNr7PoyZMiNIyYg3LPx1r7rtBcnsQBl7FmKBOaCsVUg2jFu06
	dWQHRgz/FMeJxKnp8a1dP+nYEnjNP50=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-293-0T6PFo5JPYuXvfShAJdNLg-1; Fri, 05 Jun 2020 22:51:04 -0400
X-MC-Unique: 0T6PFo5JPYuXvfShAJdNLg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EB7FE884DCA;
	Sat,  6 Jun 2020 02:50:59 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 173F7707C7;
	Sat,  6 Jun 2020 02:50:59 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BD2E314CCD;
	Sat,  6 Jun 2020 02:50:58 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 055L9Fp9009683 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 5 Jun 2020 17:09:15 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3833C2026D69; Fri,  5 Jun 2020 21:09:15 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 33D582026D67
	for <linux-audit@redhat.com>; Fri,  5 Jun 2020 21:09:13 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3D1058007A4
	for <linux-audit@redhat.com>; Fri,  5 Jun 2020 21:09:13 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182]) by
	relay.mimecast.com with ESMTP id us-mta-180-OEk_6M7kMdKPJyol4lP5_Q-1;
	Fri, 05 Jun 2020 17:09:10 -0400
X-MC-Unique: OEk_6M7kMdKPJyol4lP5_Q-1
Received: from [192.168.0.104] (c-73-42-176-67.hsd1.wa.comcast.net
	[73.42.176.67])
	by linux.microsoft.com (Postfix) with ESMTPSA id 921A220B7185;
	Fri,  5 Jun 2020 14:09:09 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 921A220B7185
Subject: Re: [PATCH] IMA: Add log statements for failure conditions
To: Paul Moore <paul@paul-moore.com>
References: <20200604163243.2575-1-nramas@linux.microsoft.com>
	<1591382782.5816.36.camel@linux.ibm.com>
	<CAHC9VhS-EP=Kk3GKRzAGAYa5mqupkLQCHz_m_DgoAKRWcSTgLA@mail.gmail.com>
	<8dfb3fa6-5c1f-d644-7d21-72a9448c52cc@linux.microsoft.com>
	<CAHC9VhS8gmrWxt75aHAE16PWAay7sUrffZiT0A8VLugwexK4Uw@mail.gmail.com>
From: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
Message-ID: <48ff60f1-df93-5ce7-a254-8bfd1dba2ade@linux.microsoft.com>
Date: Fri, 5 Jun 2020 14:09:09 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <CAHC9VhS8gmrWxt75aHAE16PWAay7sUrffZiT0A8VLugwexK4Uw@mail.gmail.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Fri, 05 Jun 2020 22:50:43 -0400
Cc: tusharsu@linux.microsoft.com, linux-integrity@vger.kernel.org,
	linux-audit@redhat.com, linux-kernel@vger.kernel.org,
	Mimi Zohar <zohar@linux.ibm.com>
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
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit

On 6/5/20 1:49 PM, Paul Moore wrote:

> 
>> Since a pr_xyz() call was already present, I just wanted to change the
>> log level to keep the code change to the minimum. But if audit log is
>> the right approach for this case, I'll update.
> 
> Generally we reserve audit for things that are required for various
> security certifications and/or "security relevant".  From what you
> mentioned above, it seems like this would fall into the second
> category if not the first.
> 
> Looking at your patch it doesn't look like you are trying to record
> anything special so you may be able to use the existing
> integrity_audit_msg(...) helper.  Of course then the question comes
> down to the audit record type (the audit_msgno argument), the
> operation (op), and the comm/cause (cause).
> 
> Do you feel that any of the existing audit record types are a good fit for this?
> 

Maybe I can use the audit_msgno "AUDIT_INTEGRITY_PCR" with appropriate 
strings for "op" and "cause".

Mimi - please let me know if you think this audit_msgno would be ok to 
use. I see this code used, for instance, for boot aggregate measurement.

integrity_audit_msg(AUDIT_INTEGRITY_PCR, NULL, boot_aggregate_name, op,
		    audit_cause, result, 0);

thanks,
  -lakshmi

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

