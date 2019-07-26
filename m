Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 428F275CA9
	for <lists+linux-audit@lfdr.de>; Fri, 26 Jul 2019 03:52:58 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4CF7F85539;
	Fri, 26 Jul 2019 01:52:54 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BAC0436FB;
	Fri, 26 Jul 2019 01:52:51 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C36A241F53;
	Fri, 26 Jul 2019 01:52:46 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x6Q1qWTm014953 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 25 Jul 2019 21:52:32 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8E58D5DDD9; Fri, 26 Jul 2019 01:52:32 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx16.extmail.prod.ext.phx2.redhat.com
	[10.5.110.45])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 88ABB67134
	for <linux-audit@redhat.com>; Fri, 26 Jul 2019 01:52:30 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com
	[209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 20CAB30C1346
	for <linux-audit@redhat.com>; Fri, 26 Jul 2019 01:52:29 +0000 (UTC)
Received: by mail-pg1-f175.google.com with SMTP id f5so15117569pgu.5
	for <linux-audit@redhat.com>; Thu, 25 Jul 2019 18:52:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=magitekltd-com.20150623.gappssmtp.com; s=20150623;
	h=from:subject:to:message-id:date:user-agent:mime-version
	:content-language;
	bh=T3afDrgMvaPpTbFa2rdSzVQ9fVDBYNmIkxjLrvtsvno=;
	b=gCBfCiIWCnPFqVZG+s9lLTH8OX2Z9+GqBQQKxpUJT3O6YrwYyu/5CL/l4D0V8AHaYT
	40wpaNaq5Ic/GLU40aZ8CnWLhC12j5iulhL9hJU/9sdn9Y6MRu60axmX4oLD/enlRIb9
	umLoxhN9AtXYQ2xmho/HErPlMbyp/cMt9pcUVnFHdwq0RIcgGDfrOe2nFsupmTQkJSJg
	J9xLitfrQIBI1Hr2jmP7sMjuQUO2HnCemB2WfOyKInm9FfRZhTFGPPN6Nxc8UJ55Mu6L
	9+kr8s2ews+RS5t/pRYuapM8wNyvtYIs3IK/3Evrt1rWdyxvHQmDQ/iEZ8Er0wvxyl/B
	pYBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:subject:to:message-id:date:user-agent
	:mime-version:content-language;
	bh=T3afDrgMvaPpTbFa2rdSzVQ9fVDBYNmIkxjLrvtsvno=;
	b=gzohl7g58Ewepp7NGZV09JvO/0BjwR1Cu7WxySmMTYiaqhDyoU3et0Q2LC+DmHBPpI
	Wlox+ZtV1hSbyoy161ExFz2ZNqT4cMhGE2eeKJ3Il+JdVdelNngoXKaBM0UsnrY0DbzR
	g6o2ZwF+pMjQOwqQx/+5LGez0DuoEW+1cAinUGDYWJLdEoyLN6OVrqzG4/RqLf/XWcw9
	P/bReWijgGR9D7w5PfhyMi5u8duVe0leq9wVzOL0VIxwI+fmLggZqDZjbsMhknjxs8k8
	dyZoMjp/yEFl0vPtlLGmt3uY2wndnvGbq45cnM//pmUAexyq4OP/1EBvPcetgEml9xSl
	W4Uw==
X-Gm-Message-State: APjAAAVcBLzlwYWOCATcc4H473HcCWLkFbsaXMVDXUS949KhPKTzzaDZ
	juvfkDNp/ufTndxdFGkcnu3rFXNd
X-Google-Smtp-Source: APXvYqzJR0/w1OLS+jwWjFPBXj1x24Xyf5FSU6sdFJjKHDKRFZqQok8lz5dMBJ3FFlNhil+f+ycsxA==
X-Received: by 2002:a17:90a:26ea:: with SMTP id
	m97mr95814493pje.59.1564105948333; 
	Thu, 25 Jul 2019 18:52:28 -0700 (PDT)
Received: from [192.168.0.162] ([216.158.248.195])
	by smtp.gmail.com with ESMTPSA id
	11sm51991705pfw.33.2019.07.25.18.52.27 for <linux-audit@redhat.com>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 25 Jul 2019 18:52:27 -0700 (PDT)
From: Lenny Bruzenak <lenny@magitekltd.com>
Subject: boot parameter question
To: "Linux-audit@redhat.com" <linux-audit@redhat.com>
Message-ID: <e8fbd095-9983-528e-dc8e-602280b414d8@magitekltd.com>
Date: Thu, 25 Jul 2019 19:52:24 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.1
MIME-Version: 1.0
Content-Language: en-US
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.45]);
	Fri, 26 Jul 2019 01:52:29 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.45]);
	Fri, 26 Jul 2019 01:52:29 +0000 (UTC) for IP:'209.85.215.175'
	DOMAIN:'mail-pg1-f175.google.com'
	HELO:'mail-pg1-f175.google.com' FROM:'lenny@magitekltd.com' RCPT:''
X-RedHat-Spam-Score: 0.003  (DKIM_SIGNED, DKIM_VALID, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE, SPF_HELO_NONE,
	SPF_NONE) 209.85.215.175 mail-pg1-f175.google.com 209.85.215.175
	mail-pg1-f175.google.com <lenny@magitekltd.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.45
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
Content-Type: multipart/mixed; boundary="===============1860879968779466492=="
Sender: linux-audit-bounces@redhat.com
Errors-To: linux-audit-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.28]); Fri, 26 Jul 2019 01:52:57 +0000 (UTC)

This is a multi-part message in MIME format.
--===============1860879968779466492==
Content-Type: multipart/alternative;
	boundary="------------2297D10C1CC8A83EBB766FD2"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------2297D10C1CC8A83EBB766FD2
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

I'm having trouble getting my "audit_backlog_limit" boot parameter
accepted.

I have the following 2 audit parameters on my boot line:

audit=1

audit_backlog_limit=8192

My /proc/cmdline shows them both once booted up.

But I'm not getting the audit_backlog_limit applied to the kernel audit
startup. I have a auditctl -b 8192 that runs from the audit.rules, and
the resulting CONFIG_change event shows "...audit_backlog_limit=8192,
old=64...".

After startup I run:

# auditctl -s

and see that I've lost 93 events.


Looking at the kernel code, I see that if the "audit=1" value is set, it
should print:

"enabled (after initialization)" , which I see in both dmesg and
/var/log/messages,

The second one (audit_backlog_limit=8192) should output IIUC:

"audit_backlog_limit: "  , which I don't see anywhere.

It's as if the parameter is being ignored. I've tried moving it to a
different spot so it isn't the last on the line, etc. Nothing.

I stumbled on this because I'm not seeing the "SYSTEM_BOOT" events
anymore; I suspect they are in the missing ones.

Pretty sure I don't have a typo; I've put it into the grub config and
run the grub2-mkconfig -o /boot/grub2/grub.cfg and booted from that.
Again, the parameter is there in /proc/cmdline but doesn't seem to be
accepted. No warnings about it either AFAICT.

RHEL7.6, kernel 3.10.0-957

Don't think the audit userspace version makes much difference, but it is
2.8.5.

Thanks in advance,

LCB

-- 
Lenny Bruzenak
MagitekLTD


--------------2297D10C1CC8A83EBB766FD2
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p>I'm having trouble getting my "audit_backlog_limit" boot
      parameter accepted. <br>
    </p>
    <p>I have the following 2 audit parameters on my boot line:</p>
    <p>audit=1</p>
    <p>audit_backlog_limit=8192</p>
    <p>My /proc/cmdline shows them both once booted up.</p>
    <p>But I'm not getting the audit_backlog_limit applied to the kernel
      audit startup. I have a auditctl -b 8192 that runs from the
      audit.rules, and the resulting CONFIG_change event shows
      "...audit_backlog_limit=8192, old=64...".</p>
    <p>After startup I run:</p>
    <p># auditctl -s</p>
    <p>and see that I've lost 93 events.</p>
    <p><br>
    </p>
    <p>Looking at the kernel code, I see that if the "audit=1" value is
      set, it should print:</p>
    <p>"enabled (after initialization)" , which I see in both dmesg and
      /var/log/messages, <br>
    </p>
    <p>The second one (audit_backlog_limit=8192) should output IIUC:<br>
    </p>
    <span class="pl-c1"></span><span class="pl-s"><span class="pl-pds">"</span>audit_backlog_limit:
      <span class="pl-pds">"</span></span>  , which I don't see
    anywhere.
    <p>It's as if the parameter is being ignored. I've tried moving it
      to a different spot so it isn't the last on the line, etc.
      Nothing. <br>
    </p>
    <p>I stumbled on this because I'm not seeing the "SYSTEM_BOOT"
      events anymore; I suspect they are in the missing ones.<br>
    </p>
    <p>Pretty sure I don't have a typo; I've put it into the grub config
      and run the grub2-mkconfig -o /boot/grub2/grub.cfg and booted from
      that. Again, the parameter is there in /proc/cmdline but doesn't
      seem to be accepted. No warnings about it either AFAICT.</p>
    <p>RHEL7.6, kernel 3.10.0-957 </p>
    <p>Don't think the audit userspace version makes much difference,
      but it is 2.8.5.</p>
    <p>Thanks in advance,</p>
    <p>LCB<br>
    </p>
    <pre class="moz-signature" cols="72">-- 
Lenny Bruzenak
MagitekLTD</pre>
  </body>
</html>

--------------2297D10C1CC8A83EBB766FD2--


--===============1860879968779466492==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
--===============1860879968779466492==--

