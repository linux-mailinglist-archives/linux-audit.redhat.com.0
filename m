Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id A055C150CB7
	for <lists+linux-audit@lfdr.de>; Mon,  3 Feb 2020 17:39:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1580747954;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=/6cS8HtsTj0PwTihwAh0KtbsauCpWpW/SfDzUAjfXf4=;
	b=Jp19MD1bxQMLKxeZjiyvLGdJEgzV1pnSpj4j1fDi4pAuNdTNzz3vyNAMaLZjvYKfNI23ZZ
	wtKNYcQxE+F2BlkurjBJZCbT6jGIgEnB9C9+6aivuNkvIBJM/KTJUThSrRoTV1GOUTXRhL
	kTws+BrWOHxLMW+HiZnFebQHFnQA6i0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-424-1rqfgLqkPuywXhikR519_Q-1; Mon, 03 Feb 2020 11:39:10 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 287BE107ACC4;
	Mon,  3 Feb 2020 16:39:02 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 43B438642F;
	Mon,  3 Feb 2020 16:38:58 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4C54D18089C8;
	Mon,  3 Feb 2020 16:38:51 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 013Ga2NJ014832 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 3 Feb 2020 11:36:02 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 578CB60C05; Mon,  3 Feb 2020 16:36:02 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from x2.localnet (ovpn-116-197.phx2.redhat.com [10.3.116.197])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0D5EF60BF7;
	Mon,  3 Feb 2020 16:35:58 +0000 (UTC)
From: Steve Grubb <sgrubb@redhat.com>
To: linux-audit@redhat.com, burn@swtf.dyndns.org
Subject: Re: USBguard bug
Date: Mon, 03 Feb 2020 11:35:58 -0500
Message-ID: <2617745.EWgzpobAnq@x2>
Organization: Red Hat
In-Reply-To: <60ca6b1cdb64b8c27f328f93ec01fa6596dfce46.camel@iinet.net.au>
References: <60ca6b1cdb64b8c27f328f93ec01fa6596dfce46.camel@iinet.net.au>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: linux-audit@redhat.com
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
X-MC-Unique: 1rqfgLqkPuywXhikR519_Q-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hello,

On Friday, January 31, 2020 4:58:18 PM EST Burn Alting wrote:
> Currently when the USB management framework, usbguard (
> https://github.com/USBGuard/usbguard),  is building it's key-value pairs
> prior to calling audit_log_user_message() with a AUDIT_USER_DEVICE type,
> it looks at each value  and decides to hex encode the value if any
> character  in the value matches the expression (str[i] == '"' || str[i] <
> 0x21 || str[i] == 0x7F). 

It should be calling audit_value_needs_encoding().

> This can be found in
> https://github.com/USBGuard/usbguard/blob/master/src/Daemon/LinuxAuditBack
> end.cpp where it makes the call
> 
> 	audit_log_user_message(_audit_fd, AUDIT_USER_DEVICE, message.c_str(),
>       /*hostname=*/nullptr, /*addr=*/nullptr, /*tty=*/nullptr, result);
> 
> As a result, one sees audit events such as
 
<snip>


> I have a number of questions
> - What is the best recommendation I can make in a bug report I'd like to
> raise so that the auparse library can reliably interpret all their key's
> values?

If its a field that is knowingly going to be user controlled, then it has to 
follow the convention shown here:

https://github.com/linux-audit/audit-userspace/blob/master/lib/
audit_logging.c#L196

Notably, the "else" branch includes double quotes. 


> - Should I also request they actually provide hostname and addr
> values to audit_log_user_message()?

This should be covered by auditd.conf, name_format.


> - If one want them to identify the user who participates in the activity
> what is the best recommendation to make in terms of keys in the message?

There is no way to associate a user to a device being plugged in. What if no 
one is logged in? For example a "janitor" walks by a system at night and 
plugs in a usb cactus or evil crow. And then sometimes a system permanently 
has a usb device connected and the event is seen during boot before people 
log in.

-Steve


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

