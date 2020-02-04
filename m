Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 56EE6151C2C
	for <lists+linux-audit@lfdr.de>; Tue,  4 Feb 2020 15:27:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1580826427;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=QClY0OLFlqjLgApkPBkoLuh9d4opoRXClNQlqMnJg7o=;
	b=SdNJJFJiYGJIsL8Vj7eUFl1ZDOpEOHKr40u84SJEalK31sniON1HT3zNaBU8/lDIy5QIsw
	LdtCu70me/dPqFdgXWF53cIYZd3nOT/UCGS6eEEX+wcT8cXGAfbJBleEPTkWys4vsUQIoH
	0m47u5NbEt0OQDdhYUhmavtOyZJuYJI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-196-spOujf9CPuKguMQvNkEN7g-1; Tue, 04 Feb 2020 09:27:04 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4AB91100F5B1;
	Tue,  4 Feb 2020 14:26:58 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7565110018FF;
	Tue,  4 Feb 2020 14:26:56 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 45B1818089CD;
	Tue,  4 Feb 2020 14:26:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 014EQiFv030638 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 4 Feb 2020 09:26:44 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 896165C3F8; Tue,  4 Feb 2020 14:26:44 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from x2.localnet (ovpn-116-11.phx2.redhat.com [10.3.116.11])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3114A5C1D4;
	Tue,  4 Feb 2020 14:26:40 +0000 (UTC)
From: Steve Grubb <sgrubb@redhat.com>
To: burn@swtf.dyndns.org
Subject: Re: USBguard bug
Date: Tue, 04 Feb 2020 09:26:39 -0500
Message-ID: <98808004.Fmvy67hF9p@x2>
Organization: Red Hat
In-Reply-To: <0d16a8086bd4d075880f6d4fc88341a5f0fcb755.camel@iinet.net.au>
References: <60ca6b1cdb64b8c27f328f93ec01fa6596dfce46.camel@iinet.net.au>
	<2617745.EWgzpobAnq@x2>
	<0d16a8086bd4d075880f6d4fc88341a5f0fcb755.camel@iinet.net.au>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: linux-audit@redhat.com
Cc: linux-audit@redhat.com
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
X-MC-Unique: spOujf9CPuKguMQvNkEN7g-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tuesday, February 4, 2020 3:10:14 AM EST Burn Alting wrote:
> On Mon, 2020-02-03 at 11:35 -0500, Steve Grubb wrote:
> > Hello,
> > 
> > On Friday, January 31, 2020 4:58:18 PM EST Burn Alting wrote:
> > > Currently when the USB management framework, usbguard (
> > > https://github.com/USBGuard/usbguard),  is building it's key-value
> > > pairsprior to calling audit_log_user_message() with a
> > > AUDIT_USER_DEVICE type,it looks at each value  and decides to hex
> > > encode the value if anycharacter  in the value matches the expression
> > > (str[i] == '"' || str[i] <0x21 || str[i] == 0x7F).> 
> > It should be calling audit_value_needs_encoding().
> > 
> > > This can be found in
> > > https://github.com/USBGuard/usbguard/blob/master/src/Daemon/LinuxAuditB
> > > ack
> > > end.cpp where it makes the call
> > > 
> > > 	audit_log_user_message(_audit_fd, AUDIT_USER_DEVICE,
> > > 
> > > message.c_str(),      /*hostname=*/nullptr, /*addr=*/nullptr,
> > > /*tty=*/nullptr, result);
> > > As a result, one sees audit events such as
> >  
> >  <snip>
> >  
> > > I have a number of questions- What is the best recommendation I can
> > > make in a bug report I'd like toraise so that the auparse library can
> > > reliably interpret all their key'svalues?
> > 
> > If its a field that is knowingly going to be user controlled, then it has
> > to follow the convention shown here:
> > https://github.com/linux-audit/audit-userspace/blob/master/lib/
> > audit_logging.c#L196
> > Notably, the "else" branch includes double quotes.
> 
> I believe their code does that. I should have been a little clearer ... if
> they have a msg value with multiple key value pairs, some escaped with
> double quotes and other hex encoded, how do I get ausearch to reliably
> decode the hex encoded value?

It should decode hex-encoded fields.

> Do we need to add usbguard specific keys to
> auparse/typetab.h?

Possibly. They may have did their own thing without coordination. Wouldn't be 
the first time nor the last.

> > > - Should I also request they actually provide hostname and addrvalues
> > > to audit_log_user_message()?
> > 
> > This should be covered by auditd.conf, name_format.
> > 
> > > - If one want them to identify the user who participates in the
> > > activitywhat is the best recommendation to make in terms of keys in
> > > the message?
> > 
> > There is no way to associate a user to a device being plugged in. What if
> > no one is logged in? For example a "janitor" walks by a system at night
> > and plugs in a usb cactus or evil crow. And then sometimes a system
> > permanently has a usb device connected and the event is seen during boot
> > before people log in.
>
> Agreed, but the USBguard daemon accepts commands from authorised users and
> acts on those commands. For example, blocking or unblocking access for a
> device just inserted. What key should be given in their msg string given
> the initiating user is not root (or unset). At the moment, they don't log
> this detail but I will ask them to, so want to advise the key to use.

sauid is used for second-hand information. It is not considered trustworthy 
since the kernel isn't the source of the identity. We need their subject 
label as well.

And if you are talking to them, I do not believe it is proper to log the 
actual rule that they are triggering on. This causes a lot of hex-encoded 
text that is meaningless.

-Steve


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

