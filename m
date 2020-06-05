Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id D01151F0442
	for <lists+linux-audit@lfdr.de>; Sat,  6 Jun 2020 04:51:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1591411867;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=P43nYAM5x9XXHhPmZNz4sN/iSpWqqE+REULCpPIhUAc=;
	b=i38zSw3/5PL9mYRMqT66aYimHydEMgdiAnqwwsFeUYtdCpURyfzJflf/2CX/RFn0DHFwYM
	KaYW6SwG4n4o8nD3AMczL+sedx1vsukva7hpZH/65rbOMSnEkdgii71cASrXBuNDbygCOF
	8nBGUI2buJ6e54+KWk/tCBFwp8nV79Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-330-BoKgclOdOmSmOnDAU_mnnA-1; Fri, 05 Jun 2020 22:51:05 -0400
X-MC-Unique: BoKgclOdOmSmOnDAU_mnnA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AD293107ACF3;
	Sat,  6 Jun 2020 02:51:00 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8D2AA100238E;
	Sat,  6 Jun 2020 02:51:00 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6074A1809547;
	Sat,  6 Jun 2020 02:51:00 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 055LaU2u011446 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 5 Jun 2020 17:36:30 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6BE195EDCA; Fri,  5 Jun 2020 21:36:30 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 67AD55EDF5
	for <linux-audit@redhat.com>; Fri,  5 Jun 2020 21:36:28 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 409478E2DD4
	for <linux-audit@redhat.com>; Fri,  5 Jun 2020 21:36:28 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182]) by
	relay.mimecast.com with ESMTP id us-mta-455-7Q5ZED6QMVSl1JEIwR75sg-1;
	Fri, 05 Jun 2020 17:36:25 -0400
X-MC-Unique: 7Q5ZED6QMVSl1JEIwR75sg-1
Received: from [192.168.0.104] (c-73-42-176-67.hsd1.wa.comcast.net
	[73.42.176.67])
	by linux.microsoft.com (Postfix) with ESMTPSA id B08E720B7185;
	Fri,  5 Jun 2020 14:36:23 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com B08E720B7185
Subject: Re: [PATCH] IMA: Add log statements for failure conditions
To: Mimi Zohar <zohar@linux.ibm.com>, Paul Moore <paul@paul-moore.com>
References: <20200604163243.2575-1-nramas@linux.microsoft.com>
	<1591382782.5816.36.camel@linux.ibm.com>
	<CAHC9VhS-EP=Kk3GKRzAGAYa5mqupkLQCHz_m_DgoAKRWcSTgLA@mail.gmail.com>
	<8dfb3fa6-5c1f-d644-7d21-72a9448c52cc@linux.microsoft.com>
	<CAHC9VhS8gmrWxt75aHAE16PWAay7sUrffZiT0A8VLugwexK4Uw@mail.gmail.com>
	<48ff60f1-df93-5ce7-a254-8bfd1dba2ade@linux.microsoft.com>
	<1591392867.4615.20.camel@linux.ibm.com>
From: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
Message-ID: <755741f8-7f55-e40d-bb05-c05be2e02e9e@linux.microsoft.com>
Date: Fri, 5 Jun 2020 14:36:22 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <1591392867.4615.20.camel@linux.ibm.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Fri, 05 Jun 2020 22:50:43 -0400
Cc: tusharsu@linux.microsoft.com, linux-integrity@vger.kernel.org,
	linux-audit@redhat.com, linux-kernel@vger.kernel.org
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit

On 6/5/20 2:34 PM, Mimi Zohar wrote:

>>
>> Maybe I can use the audit_msgno "AUDIT_INTEGRITY_PCR" with appropriate
>> strings for "op" and "cause".
>>
>> Mimi - please let me know if you think this audit_msgno would be ok to
>> use. I see this code used, for instance, for boot aggregate measurement.
>>
>> integrity_audit_msg(AUDIT_INTEGRITY_PCR, NULL, boot_aggregate_name, op,
>> 		    audit_cause, result, 0);
> 
> Yes, AUDIT_INTEGRITY_PCR is also used for failures to add to the
> measurement list.
> 

thanks - i'll post an updated patch shortly.

  -lakshmi

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

