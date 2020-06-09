Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id E1E221F41C2
	for <lists+linux-audit@lfdr.de>; Tue,  9 Jun 2020 19:09:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1591722544;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=wWvGF0+bsUKXMYwm60sDqG/yzkFanaocUHjTJt+r35s=;
	b=Mz29ArP81KHuVoCYEQG4ftQh2zVE/QmpwQww7ow/eK0TH9Af6qQsNZdo1BY923iN3fSOd+
	FAWLbc3lPQ/qphdnEWRBPTYsMuS3LVHv5yxb4cwEWnrsE60Sh9WPse6uQqBhrLoTN5fimj
	17JgX5WQqYhIJZQFrUhkYSNe+44wVL4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-333-hQyDgImYNCyYaa6W8WxYhg-1; Tue, 09 Jun 2020 13:09:02 -0400
X-MC-Unique: hQyDgImYNCyYaa6W8WxYhg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8654618A8221;
	Tue,  9 Jun 2020 17:08:57 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F1C685D9E4;
	Tue,  9 Jun 2020 17:08:55 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6774FB349D;
	Tue,  9 Jun 2020 17:08:54 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 059H12rw029701 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 9 Jun 2020 13:01:02 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 097362156A3B; Tue,  9 Jun 2020 17:01:02 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 045352157F23
	for <linux-audit@redhat.com>; Tue,  9 Jun 2020 17:00:59 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 95037833B46
	for <linux-audit@redhat.com>; Tue,  9 Jun 2020 17:00:59 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182]) by
	relay.mimecast.com with ESMTP id us-mta-234-3nLTSokNPu2C62oDs7WZaQ-1;
	Tue, 09 Jun 2020 13:00:55 -0400
X-MC-Unique: 3nLTSokNPu2C62oDs7WZaQ-1
Received: from [192.168.0.104] (c-73-42-176-67.hsd1.wa.comcast.net
	[73.42.176.67])
	by linux.microsoft.com (Postfix) with ESMTPSA id 8740B20B717B;
	Tue,  9 Jun 2020 10:00:53 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 8740B20B717B
Subject: Re: [PATCH v3] IMA: Add audit log for failure conditions
To: Steve Grubb <sgrubb@redhat.com>
References: <20200608215343.4491-1-nramas@linux.microsoft.com>
	<27448076.Og45N0Lxmj@x2>
	<ada45440-aefd-a4b2-2a3b-c012872e86cb@linux.microsoft.com>
	<3776526.Vj75JV9fuy@x2>
From: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
Message-ID: <518a51b7-6c8d-f55f-c73a-b15abae8e0af@linux.microsoft.com>
Date: Tue, 9 Jun 2020 10:00:52 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <3776526.Vj75JV9fuy@x2>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Tue, 09 Jun 2020 13:08:47 -0400
Cc: linux-integrity@vger.kernel.org, linux-audit@redhat.com,
	zohar@linux.ibm.com, linux-kernel@vger.kernel.org
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit

On 6/9/20 9:43 AM, Steve Grubb wrote:

>> The number in parenthesis is the error code (such as ENOMEM, EINVAL,
>> etc.) IMA uses this format for reporting TPM errors in one of the audit
>> messages (In ima_add_template_entry()). I followed the same pattern.
>>
>> Would it be better if the value for "cause" is formatted as
>>
>>      cause=hashing_error_-22
>>
>>      cause=alloc_entry_-12
> 
> Neither fit the name=value style that all other events follow. What would fit
> the style is something like this:
> 
> cause=hashing_error  errno=-22
>   
> cause=alloc_entry errno=-12
> 
> Would this be OK? Also, errno is only to illustrate. You can name it
> something else as long as there are no use case collisions with our
> dictionary of field names.
> 
> https://github.com/linux-audit/audit-documentation/blob/master/specs/fields/
> field-dictionary.csv

I am fine with this.

"errno" is currently not listed in the dictionary of audit message field 
names (Thanks for the pointer to this one Steve)

Mimi - please let me know if you have any concerns with adding the 
"result" code in "errno" field in integrity_audit_msg().

Sample message:

[    8.051937] audit: type=1804 audit(1591633422.365:8): pid=1 uid=0 
auid=4294967295 ses=4294967295 subj=system_u:system_r:init_t:s0 
op=measuring_keys cause=hashing_error errno=-22 comm="systemd" 
name=".builtin_trusted_keys" res=0

thanks,
  -lakshmi

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

