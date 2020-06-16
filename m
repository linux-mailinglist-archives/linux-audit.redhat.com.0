Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id D3D321FB7F1
	for <lists+linux-audit@lfdr.de>; Tue, 16 Jun 2020 17:52:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1592322730;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=0m+GxbP3igRz8d4dek//tEogJqiAyus2WWOsZINh6Vw=;
	b=CUA5xYiEYCKRxLQFoHRwntZ6SjzhbwWs9FtLr0w/0aIuhlRSQvEF8y2PpM3WYDoCm0d2lU
	n7sNLP+oQq4COLqSglCVE2fPNdo20+lC+kwIIC+MrCW8ANrLsBiscZ+LlQC4tpNMtbXiXg
	oNQS+uKMZj0xHQ4qkdL6NntFkolKxWI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-230-NklxtOaAO9qykzeIV1-UsA-1; Tue, 16 Jun 2020 11:52:03 -0400
X-MC-Unique: NklxtOaAO9qykzeIV1-UsA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 543A218A8235;
	Tue, 16 Jun 2020 15:51:58 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0A44151C50;
	Tue, 16 Jun 2020 15:51:58 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9770E1809547;
	Tue, 16 Jun 2020 15:51:56 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05GFhmZh031012 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 16 Jun 2020 11:43:48 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6336810F1CD4; Tue, 16 Jun 2020 15:43:48 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5ACA810F1CBB
	for <linux-audit@redhat.com>; Tue, 16 Jun 2020 15:43:46 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F2D838007B1
	for <linux-audit@redhat.com>; Tue, 16 Jun 2020 15:43:45 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182]) by
	relay.mimecast.com with ESMTP id us-mta-56-A0JpgE3UP3WEwZ2Xh-69mA-1;
	Tue, 16 Jun 2020 11:43:33 -0400
X-MC-Unique: A0JpgE3UP3WEwZ2Xh-69mA-1
Received: from [192.168.0.104] (c-73-42-176-67.hsd1.wa.comcast.net
	[73.42.176.67])
	by linux.microsoft.com (Postfix) with ESMTPSA id C084620B4780;
	Tue, 16 Jun 2020 08:43:31 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com C084620B4780
Subject: Re: [PATCH 1/2] integrity: Add errno field in audit message
To: Steve Grubb <sgrubb@redhat.com>, Paul Moore <paul@paul-moore.com>
References: <20200611000400.3771-1-nramas@linux.microsoft.com>
	<8800031.dr63W5FlUW@x2>
	<CAHC9VhT6JSLBD-JMfQbn9eUsUg=juznRz41DTOaia-=WhrAAuA@mail.gmail.com>
	<6643272.rC52FQZPYE@x2>
From: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
Message-ID: <958966b6-9972-051f-a7d5-cd6d1beb3244@linux.microsoft.com>
Date: Tue, 16 Jun 2020 08:43:31 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <6643272.rC52FQZPYE@x2>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Tue, 16 Jun 2020 11:51:32 -0400
Cc: rgb@redhat.com, linux-integrity@vger.kernel.org, linux-audit@redhat.com,
	linux-kernel@vger.kernel.org, Mimi Zohar <zohar@linux.ibm.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit

On 6/16/20 8:29 AM, Steve Grubb wrote:

>>>>> The idea is a good idea, but you're assuming that "result" is always
>>>>> errno.  That was probably true originally, but isn't now.  For
>>>>> example, ima_appraise_measurement() calls xattr_verify(), which
>>>>> compares the security.ima hash with the calculated file hash.  On
>>>>> failure, it returns the result of memcmp().  Each and every code path
>>>>> will need to be checked.
>>>>
>>>> Good catch Mimi.
>>>>
>>>> Instead of "errno" should we just use "result" and log the value given
>>>> in the result parameter?
>>>
>>> That would likely collide with another field of the same name which is
>>> the
>>> operation's results. If it really is errno, the name is fine. It's
>>> generic
>>> enough that it can be reused on other events if that mattered.
>>
>> Steve, what is the historical reason why we have both "res" and
>> "result" for indicating a boolean success/fail?  I'm just curious how
>> we ended up this way, and who may still be using "result".
> 
> I think its pam and some other user space things did this. But because of
> mixed machines in datacenters supporting multiple versions of OS, we have to
> leave result alone. It has to be 0,1 or success/fail. We cannot use it for
> errno.

As Mimi had pointed out, since the value passed in result parameter is 
not always an error code, "errno" is not an appropriate name.

Can we add a new field, say, "op_result" to report the result of the 
specified operation?

thanks,
  -lakshmi


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

