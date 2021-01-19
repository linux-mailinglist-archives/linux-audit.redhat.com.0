Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 4F95D2FBB39
	for <lists+linux-audit@lfdr.de>; Tue, 19 Jan 2021 16:32:54 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-483-7MMQ8PZwPUK71pjB6_QLEQ-1; Tue, 19 Jan 2021 10:32:50 -0500
X-MC-Unique: 7MMQ8PZwPUK71pjB6_QLEQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 00FD81005513;
	Tue, 19 Jan 2021 15:32:43 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 41ED63AA2;
	Tue, 19 Jan 2021 15:32:39 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 40F3A1809C9F;
	Tue, 19 Jan 2021 15:32:34 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10JFW5Nd028112 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 19 Jan 2021 10:32:05 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 895B0946AF; Tue, 19 Jan 2021 15:32:05 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 833F59465C
	for <linux-audit@redhat.com>; Tue, 19 Jan 2021 15:32:03 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3794D187504E
	for <linux-audit@redhat.com>; Tue, 19 Jan 2021 15:32:03 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
	[209.85.216.47]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-86-XBhjdx-EMhS50YpJjyhoJA-1; Tue, 19 Jan 2021 10:31:59 -0500
X-MC-Unique: XBhjdx-EMhS50YpJjyhoJA-1
Received: by mail-pj1-f47.google.com with SMTP id g15so98439pjd.2
	for <linux-audit@redhat.com>; Tue, 19 Jan 2021 07:31:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language;
	bh=UXa66pl7g1kVsc6KUzWQexW/iargUA6ZTgKdXa1jx3c=;
	b=RL+d840OM5BrVecMcpKydfQMml7ICD6bygJnH2wVshAOvzLWWlyB6LB3JANS+o1jzi
	ZOViTBNRj4Dd0wyCfcQ0THFBqoK9Uy3B+iRjS9wGVebYiAj8nAPK6+gioc2qISy73SEA
	pJi824V8aDKbHytedhMqNmwyv26a9LLflugORhHN3Z9dF5v464T3KTFolp7vMtxgwOFk
	y1T9ZxFHtX69bDrwWnEil2KY3NZZNo+iyRn+b7yQrkhzIYt4nB2WrzTozTD4FUDzjCug
	4/qzyxDoaTVJ9E5LeO5U0DdOxnIAxPqXSz84IP/wzu8+0d5gh7iqpwQg/0OYmipGLhni
	s3KA==
X-Gm-Message-State: AOAM5323LdOUwF/NPNjYwWkWkciSskTMPBSBpekPqabSXW6exUmjlz/y
	sw4aHpXQ16UwmVgRHxdd1NT6F6gEnVI7pOKp
X-Google-Smtp-Source: ABdhPJzDC8OFa4ViIA4U6AVU/z+6ePu4koL0JOCeMmE9Zyt4NcfU53TDXUtu3RudOuN6fRa7LvNG/g==
X-Received: by 2002:a17:90b:33ca:: with SMTP id
	lk10mr238668pjb.186.1611070318129; 
	Tue, 19 Jan 2021 07:31:58 -0800 (PST)
Received: from [192.168.1.3] (47-220-175-246.gtwncmkt04.res.dyn.suddenlink.net.
	[47.220.175.246]) by smtp.gmail.com with ESMTPSA id
	bk18sm3747032pjb.41.2021.01.19.07.31.56 for <linux-audit@redhat.com>
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Tue, 19 Jan 2021 07:31:57 -0800 (PST)
Subject: Re: Occasional delayed output of events
To: linux-audit@redhat.com
References: <30c5dbc14368a1919717e2f39d2d4c29463c3108.camel@iinet.net.au>
	<5445873.DvuYhMxLoT@x2>
	<17715c36170.27df.85c95baa4474aabc7814e68940a78392@paul-moore.com>
	<3095712.44csPzL39Z@x2>
	<CAHC9VhT_yd=zEusQga507jA43S_stCb2kAmd_sN6fLNcdLDdWg@mail.gmail.com>
	<9a7ed1203fa7ec67000aa68281a215354c2ed5f5.camel@iinet.net.au>
From: Lenny Bruzenak <lenny@magitekltd.com>
Message-ID: <f88bcc6a-e8a8-61e3-af61-d2897df892d0@magitekltd.com>
Date: Tue, 19 Jan 2021 09:31:55 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <9a7ed1203fa7ec67000aa68281a215354c2ed5f5.camel@iinet.net.au>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: multipart/mixed; boundary="===============1037276031376299376=="

This is a multi-part message in MIME format.
--===============1037276031376299376==
Content-Type: multipart/alternative;
	boundary="------------BAA07ACB9C6C01D80DC25991"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------BAA07ACB9C6C01D80DC25991
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On 1/19/21 2:18 AM, Burn Alting wrote:

>> Anyway, my test setup isn't likely able to reproduce such a scenario
>> without some significant tweaks, so perhaps those of you who have seen
>> this problem (Burn, and anyone else?) could shed some light into the
>> state of the system when the ordering problem occurred.
>
> I tend to have a rigorous auditing posture (see the rules loaded in
> https://github.com/linux-audit/audit-userspace/issues/148) which is
> not normal for most. Perhaps, Paul, you have hit the nail on the head
> by stating that this 'severe delay' is not that unreasonable given my
> rules posture and we just need to 'deal with it' in user space.
> We still get the event data, I just need to adjust the user space
> tools to deal with this occurrence.
> As for what the system is doing, in my home case it's a Centos 7 VM
> running a tomcat service which only gets busy every 20 minutes and the
> other is a HPE Z800 running Centos 8 with 4-5 VM's mostly dormant. I
> can put any code in these hosts to assist in 'validating'/testing the
> delay. Advise and I will run.


Looking at the records which appear to be delayed (in OP), I see that
they are PATH (w/PROCTITLE). Just curious, is the path involved part of
a networked FS, or something like a VM shared directory?

Thx,

LCB

-- 
Lenny Bruzenak
MagitekLTD


--------------BAA07ACB9C6C01D80DC25991
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>On 1/19/21 2:18 AM, Burn Alting wrote:<br>
    </p>
    <blockquote type="cite"
      cite="mid:9a7ed1203fa7ec67000aa68281a215354c2ed5f5.camel@iinet.net.au">
      <blockquote type="cite" style="margin:0 0 0 .8ex; border-left:2px
        #729fcf solid;padding-left:1ex">
        <pre>
</pre>
        <pre>Anyway, my test setup isn't likely able to reproduce such a scenario</pre>
        <pre>without some significant tweaks, so perhaps those of you who have seen</pre>
        <pre>this problem (Burn, and anyone else?) could shed some light into the</pre>
        <pre>state of the system when the ordering problem occurred.</pre>
      </blockquote>
      <div><br>
      </div>
      <div>I tend to have a rigorous auditing posture (see the rules
        loaded in <a
          href="https://github.com/linux-audit/audit-userspace/issues/148"
          moz-do-not-send="true">https://github.com/linux-audit/audit-userspace/issues/148</a>)
        which is not normal for most. Perhaps, Paul, you have hit the
        nail on the head by stating that this 'severe delay' is not that
        unreasonable given my rules posture and we just need to 'deal
        with it' in user space.</div>
      <div>We still get the event data, I just need to adjust the user
        space tools to deal with this occurrence.</div>
      <div>
        As for what the system is doing, in my home case it's a Centos 7
        VM running a tomcat service which only gets busy every 20
        minutes and the other is a HPE Z800 running Centos 8 with 4-5
        VM's mostly dormant. I can put any code in these hosts to assist
        in 'validating'/testing the delay. Advise and I will run.</div>
    </blockquote>
    <p><br>
    </p>
    <p>Looking at the records which appear to be delayed (in OP), I see
      that they are PATH (w/PROCTITLE). Just curious, is the path
      involved part of a networked FS, or something like a VM shared
      directory? <br>
    </p>
    <p>Thx,</p>
    <p>LCB<br>
    </p>
    <pre class="moz-signature" cols="72">-- 
Lenny Bruzenak
MagitekLTD</pre>
  </body>
</html>

--------------BAA07ACB9C6C01D80DC25991--

--===============1037276031376299376==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
--===============1037276031376299376==--

