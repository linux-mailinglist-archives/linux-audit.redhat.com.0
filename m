Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id B8B791F413A
	for <lists+linux-audit@lfdr.de>; Tue,  9 Jun 2020 18:43:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1591720996;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=317Ye/ZI/wnM8xNddj0uPTB/La2LJ2BmaTx8v5/k6y0=;
	b=AzKHHaSwmSpJ6oF6HTQ9XH+uFwoK2xWpxA4/MF/3kdMiW9/vfQwUfTRydFZLXAau0oXH+p
	Wwp0qGw0YVfaI14MN+29Hhe0URlkQJvcoV1lsEr8iE8dEj8alxow+M4xfZu/tvgJdW4hlu
	U2djxFDQD8/CYalkomSnwuaNC+4hjRQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-429-B0FBwO1xPqGL5awSLnsgwg-1; Tue, 09 Jun 2020 12:43:14 -0400
X-MC-Unique: B0FBwO1xPqGL5awSLnsgwg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8FEB4BFC0;
	Tue,  9 Jun 2020 16:43:08 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D2787768B4;
	Tue,  9 Jun 2020 16:43:04 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 38735B349E;
	Tue,  9 Jun 2020 16:43:00 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 059FwC5h021177 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 9 Jun 2020 11:58:12 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E67D9110F399; Tue,  9 Jun 2020 15:58:11 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E2297110F396
	for <linux-audit@redhat.com>; Tue,  9 Jun 2020 15:58:08 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8425580CDB9
	for <linux-audit@redhat.com>; Tue,  9 Jun 2020 15:58:08 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182]) by
	relay.mimecast.com with ESMTP id us-mta-177-k9hq11P2Ofe_WRWLMnImIg-1;
	Tue, 09 Jun 2020 11:58:03 -0400
X-MC-Unique: k9hq11P2Ofe_WRWLMnImIg-1
Received: from [192.168.0.104] (c-73-42-176-67.hsd1.wa.comcast.net
	[73.42.176.67])
	by linux.microsoft.com (Postfix) with ESMTPSA id B053620B717B;
	Tue,  9 Jun 2020 08:58:02 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com B053620B717B
Subject: Re: [PATCH v3] IMA: Add audit log for failure conditions
To: Steve Grubb <sgrubb@redhat.com>, linux-audit@redhat.com
References: <20200608215343.4491-1-nramas@linux.microsoft.com>
	<27448076.Og45N0Lxmj@x2>
From: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
Message-ID: <ada45440-aefd-a4b2-2a3b-c012872e86cb@linux.microsoft.com>
Date: Tue, 9 Jun 2020 08:58:02 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <27448076.Og45N0Lxmj@x2>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Tue, 09 Jun 2020 12:42:52 -0400
Cc: linux-integrity@vger.kernel.org, zohar@linux.ibm.com,
	linux-kernel@vger.kernel.org
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
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit

On 6/9/20 8:40 AM, Steve Grubb wrote:

> On Monday, June 8, 2020 5:53:43 PM EDT Lakshmi Ramasubramanian wrote:
>> The final log statement in process_buffer_measurement() for failure
>> condition is at debug level. This does not log the message unless
>> the system log level is raised which would significantly increase
>> the messages in the system log. Change this log message to an audit
>> message for better triaging failures in the function.
>>
>> ima_alloc_key_entry() does not log a message for failure condition.
>> Add an audit message for failure condition in this function.
>>
>> Sample audit messages:
> 
> Wouldn't it be better to have an IMA_ERROR record type?

type "1804" is AUDIT_INTEGRITY_PCR which is used for failures to add to 
the measurement list.

> 
>> [    8.051937] audit: type=1804 audit(1591633422.365:8): pid=1 uid=0
>> auid=4294967295 ses=4294967295 subj=system_u:system_r:init_t:s0
>> op=measuring_keys cause=hashing_error(-22)
> 
> The audit system uses a name=value scheme to express information. This last
> field has something in parenthesis that may need to be interpreted. In its
> current form, we can't do this. It would require writing code to special case
> this event, go to this field, find the first parenthesis, find the second,
> extract what's between, and look it up.
> 
> It would be better if that number in parenthesis was normalized to the
> expected way we do audit events so nothing special has to be made.

The number in parenthesis is the error code (such as ENOMEM, EINVAL, 
etc.) IMA uses this format for reporting TPM errors in one of the audit 
messages (In ima_add_template_entry()). I followed the same pattern.

Would it be better if the value for "cause" is formatted as

    cause=hashing_error_-22

    cause=alloc_entry_-12

thanks,
  -lakshmi

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

